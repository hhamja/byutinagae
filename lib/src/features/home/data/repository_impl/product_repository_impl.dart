import 'package:byutinagae/src/features/home/domain/model/ingredient_model.dart';
import 'package:byutinagae/src/features/home/domain/model/product_model.dart';
import 'package:byutinagae/src/config/constant/firebase_constant.dart';
import 'package:byutinagae/src/features/home/domain/repository/product_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepositoryImplement implements ProductRepository {
  final productRef =
      FirebaseFirestore.instance.collection(FirebaseConstant.productRef);
  final ingredientModificationRef = FirebaseFirestore.instance
      .collection(FirebaseConstant.ingredientModificationRef);

  // 제품 리스트 받기
  @override
  Future<List<ProductModel>> getProductList() async {
    final List<ProductModel> productList = [];

    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await productRef.get();

    for (var doc in querySnapshot.docs) {
      ProductModel model = ProductModel.fromJson(doc.data());
      model = model.copyWith(id: doc.id);
      productList.add(model);
    }
    return productList;
  }

  // 특정 제품의 성분 정보 받기
  @override
  Future<List<IngredientModel>> getIngredientList(id) async {
    final List<IngredientModel> ingredients = [];

    final QuerySnapshot<Map<String, dynamic>> querySnapshot = await productRef
        .doc(id)
        .collection(FirebaseConstant.ingredientRef)
        // 오름차순 ex) 1,2,3,4,5
        .orderBy("index", descending: false)
        .get();

    for (var doc in querySnapshot.docs) {
      final IngredientModel model = IngredientModel.fromJson(doc.data());
      ingredients.add(model);
    }

    return ingredients;
  }

  // 성분 수정 요청
  @override
  Future addIngredientEditRequest(brand, productname) async {}
}
