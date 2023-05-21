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

  // 페이지네이션 쿼리
  @override
  queryPaginatedProductList() {
    return productRef.withConverter<ProductModel>(
      fromFirestore: (snapshot, _) {
        ProductModel model =
            ProductModel.fromJson(snapshot.data() as Map<String, dynamic>);
        model = model.copyWith(id: snapshot.id);
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
}
