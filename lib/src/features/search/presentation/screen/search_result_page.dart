import 'package:byutinagae/src/common/widget/default_layout/default_layout.dart';
import 'package:byutinagae/src/common/widget/icon_button/custom_back_button.dart';
import 'package:byutinagae/src/common/widget/loading/circular_loading.dart';
import 'package:byutinagae/src/common/widget/text_button/custom_outline_text_button.dart';
import 'package:byutinagae/src/features/search/presentation/provider/pagination_search_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:byutinagae/src/config/constant/app_name.dart';
import 'package:byutinagae/src/features/request/presentation/screen/product_add_request_page.dart';
import 'package:byutinagae/src/features/home/presentation/screen/detail_product_page.dart';
import 'package:byutinagae/src/features/home/presentation/widget/product_list_page/product_list_item.dart';

class SearchResultPage extends ConsumerStatefulWidget {
  final String inputText;

  const SearchResultPage({required this.inputText, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchResultPageState();
}

class _SearchResultPageState extends ConsumerState<SearchResultPage> {
  final ScrollController _scrollController = ScrollController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  // 페이지네이션 스크롤 리스너
  Future<void> _scrollListener() async {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      // 스크롤이 마지막에 도달하면 추가 데이터를 가져옴
      final int nextPage = currentPage + 1;
      await ref
          .read(paginatedSearchListProvider(widget.inputText).notifier)
          .fetchAdditionalProducts(nextPage);
      setState(() => currentPage = nextPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final paginatedSearchProductList =
        ref.watch(paginatedSearchListProvider(widget.inputText));

    return DefaultLayout(
      leading: const CustomBackButton(),
      title: Text('${widget.inputText} 검색결과'),
      body: paginatedSearchProductList.when(
        error: (e, _) => const Text('에러'),
        loading: () => const CustomCircularLoading(),
        data: (searchProductList) => searchProductList.isNotEmpty
            ? ListView.separated(
                itemCount: searchProductList.length,
                controller: _scrollController,
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
                                  productModel: searchProductList[index],
                                )));
                  },
                  brand: searchProductList[index].brand,
                  photoUrl: searchProductList[index].thumbnailImage,
                  price: searchProductList[index].price,
                  productName: searchProductList[index].productName,
                  volume: searchProductList[index].volume,
                ),
              )
            // 빈 데이터일 때
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '"${widget.inputText}"로 검색한 결과가 없어요:)',
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
              ),
      ),
    );
  }
}
