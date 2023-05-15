import 'package:byutinagae/src/features/home/domain/model/detail_product_model.dart';
import 'package:byutinagae/src/features/home/domain/model/ingredient_model.dart';
import 'package:byutinagae/src/features/home/domain/model/product_list_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:byutinagae/src/config/constant/firebase_constant.dart';
import 'package:byutinagae/src/features/home/domain/repository/product_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImplement();
});

class ProductRepositoryImplement implements ProductRepository {
  final _productRef =
      FirebaseFirestore.instance.collection(FirebaseConstant.productRef);

  // 제품 리스트 받기
  @override
  Future<List<ProductListModel>> getProductList() async {
    final List<ProductListModel> productList = [];

    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _productRef.get();

    for (var doc in querySnapshot.docs) {
      productList.add(ProductListModel.fromJson(doc.data()));
    }
    return productList;
  }

  // 특정 제품 세부 정보 받기
  @override
  Future<DetailProductModel> getDetailProduct(id) async {
    final DocumentSnapshot snapshot = await _productRef.doc(id).get();

    final DetailProductModel detailProduct =
        DetailProductModel.fromJson(snapshot.data() as Map<String, dynamic>);

    return detailProduct;
  }

  // 특정 제품의 성분 정보 받기
  @override
  Future<List<IngredientModel>> getProductIngredient(id) async {
    final List<IngredientModel> response = [];

    return response;
  }

  // 성분 수정 요청
  @override
  Future addIngredientEditRequest(brand, productname) async {}
}
