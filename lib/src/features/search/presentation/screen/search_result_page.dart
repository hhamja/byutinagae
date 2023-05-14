import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:byutinagae/src/config/constant/app_name.dart';
import 'package:byutinagae/src/features/common/presentation/widget/async_value/custom_error_data.dart';
import 'package:byutinagae/src/features/common/presentation/widget/default_layout/default_layout.dart';
import 'package:byutinagae/src/features/common/presentation/widget/icon_button/custom_back_button.dart';
import 'package:byutinagae/src/features/common/presentation/widget/loading/circular_loading.dart';
import 'package:byutinagae/src/features/common/presentation/widget/text_button/custom_outline_text_button.dart';
import 'package:byutinagae/src/features/feedback/presentation/screen/product_add_request_page.dart';
import 'package:byutinagae/src/features/home/presentation/screen/detail_product_page.dart';
import 'package:byutinagae/src/features/home/presentation/widget/product_list_item.dart';
import 'package:byutinagae/src/features/search/presentation/provider/search_provider.dart';

class SearchResultPage extends ConsumerWidget {
  final String query;
  const SearchResultPage({required this.query, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchProductList = ref.watch(searchProductListProvider(query));

    return DefaultLayout(
      leading: const CustomBackButton(),
      title: Text(
        '$query 검색결과',
      ),
      body: searchProductList.when(
        data: (productList) => productList.isEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '"$query"로 검색한 결과가 없어요:)',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 55),
                      const Text(
                        '추가되었으면 좋겠다는 제품이 있나요?',
                        style: TextStyle(
                          fontSize: 18,
                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 34),
                      const Text(
                        '$APP_NAME 팀에게 제품을 요청해주세요',
                        style: TextStyle(
                          fontSize: 18,
                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 55),
                      CustomOutlineTextButton(
                        w: MediaQuery.of(context).size.width,
                        h: 48,
                        content: '제품 요청하기',
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ProductAddRequestPage(),
                            ),
                          );
                        },
                        color: BLACK_COLOR,
                      ),
                    ],
                  ),
                ),
              )
            : ListView.separated(
                itemCount: productList.length,
                controller: ScrollController(),
                separatorBuilder: (context, index) => const Divider(
                  color: DEEP_LIGHT_GREY_COLOR,
                  thickness: 1,
                  height: 0,
                ),
                itemBuilder: (context, index) => ProductListItem(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailProductPage(
                          // id: productList[index].productId,
                          id: 'g3kprJi5ZGKJKww9nTO0',
                        ),
                      ),
                    );
                  },
                  brand: productList[index].brand,
                  photoUrl: productList[index].thumbnailImage,
                  price: productList[index].price,
                  productName: productList[index].productName,
                  volume: productList[index].volume,
                ),
              ),
        error: (error, stackTrace) => const CustomErrorData(),
        loading: () => const CustomCircularLoading(),
      ),
    );
  }
}
