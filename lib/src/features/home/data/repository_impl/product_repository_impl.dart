import 'package:byutinagae/src/features/home/domain/enum/product_category.dart';
import 'package:byutinagae/src/features/home/domain/model/ingredient_model.dart';
import 'package:byutinagae/src/features/home/domain/model/ingredient_modification_request_model.dart';
import 'package:byutinagae/src/features/home/domain/model/product_model.dart';
import 'package:byutinagae/src/config/constant/firebase_constant.dart';
import 'package:byutinagae/src/features/home/domain/repository/product_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepositoryImplement implements ProductRepository {
  final productRef =
      FirebaseFirestore.instance.collection(FirebaseConstant.productRef);
  final ingredientModificationRef = FirebaseFirestore.instance
      .collection(FirebaseConstant.ingredientModificationRef);
  final cleanBeautyRef = FirebaseFirestore.instance
      .collection(FirebaseConstant.cleanBeautyProductRef);
  final popularProductRef =
      FirebaseFirestore.instance.collection(FirebaseConstant.popularProductRef);

  // 카레고리의 모든 제품 리스트 받는 페이지네이션 쿼리
  @override
  queryAllCategoryProducts(TopProductCategory topCategory) {
    List<String> categoryQueryList = [];
    if (topCategory == TopProductCategory.wash) {
      categoryQueryList = [WashCategory.shampoo.name, WashCategory.rinse.name];
    } else if (topCategory == TopProductCategory.skincare) {
      categoryQueryList = [
        SkinCareCategory.mist.name,
        SkinCareCategory.moisturizer.name
      ];
    } else if (topCategory == TopProductCategory.dentalcare) {
      categoryQueryList = [DentalCareCategory.toothpaste.name];
    } else {
      categoryQueryList = [DeodorantCategory.deodorant.name];
    }

    return productRef
        .where('topCategory', whereIn: categoryQueryList)
        .withConverter<ProductModel>(
          fromFirestore: (snapshot, _) {
            final ProductModel model =
                ProductModel.fromJson(snapshot.data() as Map<String, dynamic>);
            return model;
          },
          toFirestore: (model, _) => model.toJson(),
        );
  }

  // 카테고리에서 특정 제품 라인 받는 페이지네이션 쿼리
  @override
  queryCategoryProducts(String middleCategory) {
    return productRef
        .where('middleCategory', isEqualTo: middleCategory)
        .withConverter<ProductModel>(
          fromFirestore: (snapshot, _) {
            final ProductModel model =
                ProductModel.fromJson(snapshot.data() as Map<String, dynamic>);
            return model;
          },
          toFirestore: (model, _) => model.toJson(),
        );
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

  // 성분 수정 요청
  @override
  Future requestIngredientModification(
      IngredientModificationRequestModel model) async {
    return ingredientModificationRef.add(model.toJson());
  }

  // 특정 카테고리의 클린뷰티 제품 리스트 받기
  @override
  Future<List<ProductModel>> fetchCategoryCleanBeautyProducts(
      AllProductLine productLine) async {
    final List<ProductModel> productList = [];
    final QuerySnapshot querySnapshot = await cleanBeautyRef
        .where('category', isEqualTo: productLine.name)
        .get();

    for (var doc in querySnapshot.docs) {
      final ProductModel model =
          ProductModel.fromJson(doc.data() as Map<String, dynamic>);
      productList.add(model);
    }

    return productList;
  }

  // 특정 카테고리의 인기 제품 리스트 받기
  @override
  Future<List<ProductModel>> fetchCategoryPopularProducts(
      AllProductLine productLine) async {
    final List<ProductModel> productList = [];
    final QuerySnapshot querySnapshot = await popularProductRef
        .where('category', isEqualTo: productLine.name)
        .get();

    for (var doc in querySnapshot.docs) {
      final ProductModel model =
          ProductModel.fromJson(doc.data() as Map<String, dynamic>);
      productList.add(model);
    }

    return productList;
  }

  // Home - 프리뷰 클린뷰티템 받기
  @override
  Future<List<ProductModel>> fetchPreviewCleanBeautyProducts() async {
    final List<ProductModel> productList = [];

    final List<QuerySnapshot> querySnapshots = await Future.wait([
      // 샴푸 3개
      cleanBeautyRef
          .where('category', isEqualTo: AllProductLine.shampoo.name)
          .limit(3)
          .get(),
      // // 린스, 컨디셔너 3개
      // cleanBeautyRef
      //     .where('category', isEqualTo: AllProductLine.rinse.name)
      //     .limit(3)
      //     .get(),
      // // 미스트 3개
      // cleanBeautyRef
      //     .where('category', isEqualTo: AllProductLine.mist.name)
      //     .limit(3)
      //     .get(),
      // // 보습제 3개
      // cleanBeautyRef
      //     .where('category', isEqualTo: AllProductLine.moisturizer.name)
      //     .limit(3)
      //     .get(),
      // // 탈취제 3개
      // cleanBeautyRef
      //     .where('category', isEqualTo: AllProductLine.deodorant.name)
      //     .limit(3)
      //     .get(),
      // // 치약 3개
      // cleanBeautyRef
      //     .where('category', isEqualTo: AllProductLine.toothpaste.name)
      //     .limit(3)
      //     .get(),
    ]);

    for (var querySnapshot in querySnapshots) {
      for (var doc in querySnapshot.docs) {
        final ProductModel model =
            ProductModel.fromJson(doc.data() as Map<String, dynamic>);
        productList.add(model);
      }
    }
    return productList;
  }

  // Home - 인기템 프리뷰 리스트 받기
  @override
  Future<List<ProductModel>> fetchPreviewPopularProducts() async {
    final List<ProductModel> productList = [];
    final QuerySnapshot querySnapshot = await cleanBeautyRef.limit(6).get();

    for (var doc in querySnapshot.docs) {
      final ProductModel model =
          ProductModel.fromJson(doc.data() as Map<String, dynamic>);
      productList.add(model);
    }

    return productList;
  }
}
