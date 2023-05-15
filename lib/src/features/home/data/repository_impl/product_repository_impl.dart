import 'package:byutinagae/src/features/home/domain/model/detail_product_model.dart';
import 'package:byutinagae/src/features/home/domain/model/ingredient_model.dart';
import 'package:byutinagae/src/features/home/domain/model/product_list_model.dart';
import 'package:byutinagae/src/config/constant/firebase_constant.dart';
import 'package:byutinagae/src/features/home/domain/repository/product_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepositoryImplement implements ProductRepository {
  final productRef =
      FirebaseFirestore.instance.collection(FirebaseConstant.productRef);
  final ingredientRef =
      FirebaseFirestore.instance.collection(FirebaseConstant.ingredientRef);

  // 제품 리스트 받기
  @override
  Future<List<ProductListModel>> getProductList() async {
    final List<ProductListModel> productList = [];

    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await productRef.get();

    for (var doc in querySnapshot.docs) {
      ProductListModel model = ProductListModel.fromJson(doc.data());
      model = model.copyWith(id: doc.id);
      productList.add(model);
    }
    return productList;
  }

  // 특정 제품 세부 정보 받기
  @override
  Future<DetailProductModel> getDetailProduct(id) async {
    final DocumentSnapshot snapshot = await productRef.doc(id).get();

    final DetailProductModel detailProduct =
        DetailProductModel.fromJson(snapshot.data() as Map<String, dynamic>);

    return detailProduct;
  }

  // 특정 제품의 성분 정보 받기
  @override
  Future<List<IngredientModel>> getProductIngredient(idList) async {
    final List<IngredientModel> ingredients = [];

    for (var id in idList) {
      final ingredientDoc = await ingredientRef.doc(id).get();
      if (ingredientDoc.exists) {
        final ingredientModel = IngredientModel.fromJson(
            ingredientDoc.data() as Map<String, dynamic>);
        ingredients.add(ingredientModel);
      }
    }

    return ingredients;
  }

  // 성분 수정 요청
  @override
  Future addIngredientEditRequest(brand, productname) async {}
}
