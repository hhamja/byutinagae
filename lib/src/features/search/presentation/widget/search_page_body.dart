import 'package:byutinagae/src/common/widget/text_form_field/custom_text_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:byutinagae/src/features/search/presentation/provider/recent_search_provider.dart';
import 'package:byutinagae/src/features/search/presentation/screen/search_result_page.dart';

class SearchPageBody extends ConsumerStatefulWidget {
  final FocusNode focusNode;
  const SearchPageBody({required this.focusNode, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchPageBodyState();
}

class _SearchPageBodyState extends ConsumerState<SearchPageBody> {
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    widget.focusNode.requestFocus();
    ref.read(recentSearchListProvider.notifier).getSearchList();
  }

  @override
  void dispose() {
    widget.focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> searchList = ref.watch(recentSearchListProvider);

    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 34),
          const Text(
            '어떤 제품을 찾으시나요?',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 34),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: textController.text.isNotEmpty
                      ? PRIMARY_COLOR
                      : GREY_COLOR,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    maxLine: 1,
                    maxLength: 50,
                    focusNode: widget.focusNode,
                    controller: textController,
                    // 확인 버튼 클릭시
                    onFieldSubmitted: textController.text == ''
                        ? null
                        : (value) async {
                            // 결과 페이지로 이동
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SearchResultPage(inputText: value)));
                            // 최근검색어에 추가
                            ref
                                .read(recentSearchListProvider.notifier)
                                .addSearchQuery(value);
                            // 입력 텍스트 비우기
                            textController.text = '';
                          },
                    onChanged: (value) => setState(() => value),
                    onTap: () async => setState(() =>widget. focusNode.requestFocus()),
                    hintText: '검색어를 입력해주세요',
                  ),
                ),
                textController.text != ''
                    ? InkWell(
                        onTap: () => setState(() => textController.text = ''),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(16, 10, 0, 10),
                          child: Icon(
                            Icons.close_sharp,
                            size: 25,
                            color: GREY_COLOR,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          const SizedBox(height: 89),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '최근검색어',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              searchList.isNotEmpty
                  ? InkWell(
                      onTap: () async => ref
                          .read(recentSearchListProvider.notifier)
                          .removeAllSearchIndex(),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(16, 10, 0, 10),
                        child: Text(
                          '전체삭제',
                          style: TextStyle(
                            fontSize: 14,
                            color: GREY_COLOR,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          const SizedBox(height: 8),
          searchList.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  controller: scrollController,
                  itemCount: searchList.length,
                  itemBuilder: (context, index) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () async {
                      // 결과 페이지로 이동
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchResultPage(
                                  inputText: searchList[index])));
                    },
                    title: Text(
                      searchList[index],
                      maxLines: 3,
                      style: const TextStyle(
                        fontSize: 18,
                        color: TEXT_COLOR,
                      ),
                    ),
                    trailing: InkWell(
                      onTap: () async => ref
                          .read(recentSearchListProvider.notifier)
                          .removeSearchIndex(index),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(16, 10, 0, 10),
                        child: Icon(
                          Icons.close_sharp,
                          size: 21,
                          color: GREY_COLOR,
                        ),
                      ),
                    ),
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.only(top: 55),
                  child: Center(
                    child: Text(
                      '최근 검색어가 없어요 :)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: GREY_COLOR,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
