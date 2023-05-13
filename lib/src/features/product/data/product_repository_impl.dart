import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:byutinagae/src/config/constant/firebase_constant.dart';
import 'package:byutinagae/src/features/product/data/product_repository.dart';
import 'package:byutinagae/src/features/product/domain/detail_product_model.dart';
import 'package:byutinagae/src/features/product/domain/ingredient_model.dart';
import 'package:byutinagae/src/features/product/domain/product_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  // 최근 검색어 로컬에 List로 저장
  @override
  Future<List<String>> addSearchQuery(String query) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? searchList = prefs.getStringList('searchList');
    if (searchList == null) {
      searchList = [query];
    } else {
      searchList.insert(0, query);
    }
    await prefs.setStringList('searchList', searchList);

    return searchList;
  }

  // 최근 검색어 받기
  @override
  Future<List<String>> getSearchList() async {
    final prefs = await SharedPreferences.getInstance();
    // 없다면 null반환, 있다면 리스트 반환
    List<String>? searchList = prefs.getStringList('searchList');
    // null이면 ? 빈 리스트 반환
    searchList ??= [];
    return searchList;
  }

  // 특정 최근 검색어 index 제거
  @override
  Future<List<String>> removeSearchIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> searchList = prefs.getStringList('searchList') ?? [];
    searchList.removeAt(index);
    await prefs.setStringList('searchList', searchList);
    return searchList;
  }

  // 특정 최근 검색어 index 제거
  @override
  Future removeAllSearchIndex() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('searchList');
  }

  // 제품 데이터 검색하기
  @override
  Future<List<ProductListModel>> searchProduct(String query) async {
    final List<ProductListModel> searchProductList = [];

    return searchProductList;
  }

  // 성분 수정 요청
  @override
  Future addIngredientEditRequest(brand, productname) async {}
}
