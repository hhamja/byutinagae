import 'package:byutinagae/src/common/widget/empty_data_page.dart/empty_data_page.dart';
import 'package:byutinagae/src/common/widget/loading/circular_loading.dart';
import 'package:byutinagae/src/features/home/domain/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:byutinagae/src/features/home/presentation/screen/detail_product_page.dart';
import 'package:byutinagae/src/features/home/presentation/widget/product_list_page/product_list_item.dart';

// 파이어스토어 페이지네이션 쿼리로 카테고리별 데이터를 받는 UI 정의
class TopicProductListBody extends ConsumerWidget {
  // futureProvider return List 타입
  final AsyncValue<List<ProductModel>> provider;

  const TopicProductListBody({required this.provider, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = ScrollController();

    return provider.when(
      error: (e, _) => const SizedBox.shrink(),
      loading: () => const CustomCircularLoading(),
      data: (list) => list.isEmpty
          ? const EmptyDataPage()
          : ListView.builder(
              itemCount: list.length,
              controller: scrollController,
              itemBuilder: (context, index) => ProductListItem(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailProductPage(productModel: list[index])));
                  },
                  brand: list[index].brand,
                  photoUrl: list[index].thumbnailImage,
                  price: list[index].price,
                  productName: list[index].productName,
                  volume: list[index].volume)),
    );
  }
}
