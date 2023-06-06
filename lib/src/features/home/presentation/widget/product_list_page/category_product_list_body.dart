import 'package:byutinagae/src/common/widget/empty_data_page.dart/empty_data_page.dart';
import 'package:byutinagae/src/common/widget/loading/circular_loading.dart';
import 'package:byutinagae/src/features/home/domain/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:byutinagae/src/features/home/presentation/screen/detail_product_page.dart';
import 'package:byutinagae/src/features/home/presentation/widget/product_list_page/product_list_item.dart';

// 파이어스토어 페이지네이션 쿼리로 카테고리별 데이터를 받는 UI 정의
class CategoryProductListBody extends ConsumerStatefulWidget {
  // 페이지네이션 쿼리타입 또는 futureProvider return List 타입
  final Query<ProductModel> query;

  const CategoryProductListBody({required this.query, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoryProductListBodyState();
}

class _CategoryProductListBodyState
    extends ConsumerState<CategoryProductListBody>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  bool isFetchMore = false;

  Future<void> _scrollListener() async {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      // 값을 더 받을 상태
      setState(() => isFetchMore = true);
    } else {
      // 값을 더 받지 X 않는 상태
      setState(() => isFetchMore = false);
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    // _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FirestoreQueryBuilder<ProductModel>(
      query: widget.query,
      builder: (context, snapshot, child) {
        if (snapshot.isFetching) {
          return const CustomCircularLoading();
        } else if (snapshot.hasError) {
          return const SizedBox.shrink();
        } else if (snapshot.docs.isEmpty) {
          return const EmptyDataPage();
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.docs.length,
          controller: _scrollController,
          itemBuilder: (context, index) {
            final ProductModel productModel = snapshot.docs[index].data();
            // fetch 묶음 데이터의 마지막 순번인 경우 값 더 받기
            // if (snapshot.hasMore &&
            //     (index + 1 == snapshot.docs.length)) {
            //   snapshot.fetchMore();
            // }
            if (isFetchMore) {
              snapshot.fetchMore();
              isFetchMore = false;
            }
            return ProductListItem(
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailProductPage(productModel: productModel)));
                },
                brand: productModel.brand,
                photoUrl: productModel.thumbnailImage,
                price: productModel.price,
                productName: productModel.productName,
                volume: productModel.volume);
          },
        );
      },
    );
  }
}
