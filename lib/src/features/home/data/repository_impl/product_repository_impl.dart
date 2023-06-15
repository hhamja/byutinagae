import 'package:byutinagae/src/config/constant/category_constant.dart';
import 'package:byutinagae/src/features/home/domain/model/detail_product_model.dart';
import 'package:byutinagae/src/features/home/domain/model/ingredient_model.dart';
import 'package:byutinagae/src/features/home/domain/model/ingredient_modification_request_model.dart';
import 'package:byutinagae/src/features/home/domain/model/product_list_model.dart';
import 'package:byutinagae/src/config/constant/firebase_constant.dart';
import 'package:byutinagae/src/features/home/domain/repository/product_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepositoryImplement implements ProductRepository {
  final productRef =
      FirebaseFirestore.instance.collection(FirebaseConstant.productRef);
  final ingredientModificationRef = FirebaseFirestore.instance
      .collection(FirebaseConstant.ingredientModificationRef);

  // 특정 중분류 제품 리스트 받는 페이지네이션 쿼리
  @override
  queryCategoryProducts(String middleCategory) {
    return productRef
        .where('middleCategory', isEqualTo: middleCategory)
        .withConverter<ProductListModel>(
          fromFirestore: (snapshot, _) {
            final ProductListModel model = ProductListModel.fromJson(
                snapshot.data() as Map<String, dynamic>);
            return model;
          },
          toFirestore: (model, _) => model.toJson(),
        );
  }

  // 제품 세부정보 받기
  @override
  Future<DetailProductModel> fetchProductDetail(String id) async {
    final DocumentSnapshot snapshot = await productRef.doc(id).get();
    if (snapshot.exists) {
      final Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      final DetailProductModel detailModel = DetailProductModel.fromJson(data);
      return detailModel;
    } else {
      // 제품 세부 정보가 존재하지 않는 경우, 예외 처리
      throw Exception('제품을 찾을 수 없습니다.');
    }
  }

  // 특정 제품의 성분 정보 받기
  @override
  Future<List<IngredientModel>> fetchIngredientList(String id) async {
    final List<IngredientModel> ingredients = [];
    final ref = productRef.doc(id).collection(FirebaseConstant.ingredientRef);
    final QuerySnapshot<Map<String, dynamic>> querySnapshot = await ref
        // 오름차순 ex) 1,2,3,4,5
        .orderBy("index", descending: false)
        .get();

    if (ref.path.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        final IngredientModel model = IngredientModel.fromJson(doc.data());
        ingredients.add(model);
      }
    }

    return ingredients;
  }

  // 특정 대분류의 클린뷰티 제품 리스트 받기
  @override
  Future<List<ProductListModel>> fetchTopCategoryCleanBeautyProducts(
      String topCategory) async {
    final List<ProductListModel> productList = [];
    final QuerySnapshot querySnapshot = await productRef
        .where('topCategory', isEqualTo: topCategory)
        .where('tag', arrayContains: Category.cleanBeauty)
        .get();

    for (var doc in querySnapshot.docs) {
      final ProductListModel model =
          ProductListModel.fromJson(doc.data() as Map<String, dynamic>);
      productList.add(model);
    }

    return productList;
  }

  // 특정 대분류의 인기 제품 리스트 받기
  @override
  Future<List<ProductListModel>> fetchTopCategoryPopularProducts(
      String topCategory) async {
    final List<ProductListModel> productList = [];
    final QuerySnapshot querySnapshot = await productRef
        .where('topCategory', isEqualTo: topCategory)
        .where('tag', arrayContains: Category.popular)
        .get();

    for (var doc in querySnapshot.docs) {
      final ProductListModel model =
          ProductListModel.fromJson(doc.data() as Map<String, dynamic>);
      productList.add(model);
    }

    return productList;
  }

  // Home - 프리뷰 클린뷰티템 받기
  @override
  Future<List<ProductListModel>> fetchPreviewCleanBeautyProducts(
      String topCategory) async {
    final List<ProductListModel> productList = [];

    final List<QuerySnapshot> querySnapshots = await Future.wait([
      productRef
          .where('topCategory', isEqualTo: topCategory)
          .where('tag', arrayContains: Category.cleanBeauty)
          .limit(3)
          .get(),
    ]);

    for (var querySnapshot in querySnapshots) {
      for (var doc in querySnapshot.docs) {
        final ProductListModel model =
            ProductListModel.fromJson(doc.data() as Map<String, dynamic>);
        productList.add(model);
      }
    }
    return productList;
  }

  // Home - 인기템 프리뷰 리스트 받기
  @override
  Future<List<ProductListModel>> fetchPreviewPopularProducts() async {
    final List<ProductListModel> productList = [];
    final QuerySnapshot querySnapshot = await productRef
        .where('tag', arrayContains: Category.popular)
        .limit(6)
        .get();

    for (var doc in querySnapshot.docs) {
      final ProductListModel model =
          ProductListModel.fromJson(doc.data() as Map<String, dynamic>);
      productList.add(model);
    }

    return productList;
  }

  // 성분 수정 요청
  @override
  Future requestIngredientModification(
      IngredientModificationRequestModel model) async {
    return ingredientModificationRef.add(model.toJson());
  }
}
