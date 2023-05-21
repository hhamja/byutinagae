import 'package:byutinagae/src/common/widget/default_layout/default_layout.dart';
import 'package:byutinagae/src/common/widget/dialog/small_dialog.dart';
import 'package:byutinagae/src/common/widget/icon_button/custom_back_button.dart';
import 'package:byutinagae/src/common/widget/text_button/custom_outline_text_button.dart';
import 'package:byutinagae/src/features/home/domain/model/ingredient_model.dart';
import 'package:byutinagae/src/features/home/domain/model/ingredient_modification_request_model.dart';
import 'package:byutinagae/src/features/home/domain/provider/product_repository_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:byutinagae/src/features/home/presentation/widget/ingredient_composition.dart';
import 'package:byutinagae/src/features/home/presentation/widget/ingredient_info_bottom_sheet.dart';
import 'package:byutinagae/src/features/home/presentation/widget/ingredient_list_tile.dart';

class IngredientListPage extends StatefulWidget {
  final List<IngredientModel> ingredientList;
  final String productName;
  final String brand;

  const IngredientListPage({
    super.key,
    required this.ingredientList,
    required this.productName,
    required this.brand,
  });

  @override
  State<IngredientListPage> createState() => _IngredientListPageState();
}

class _IngredientListPageState extends State<IngredientListPage> {
  late List<String> undeterminedRisk;
  late List<String> lowRiskEwgList;
  late List<String> mediumRiskEwgList;
  late List<String> highRiskEwgList;
  late Color color;
  final ScrollController controller = ScrollController();

  // ewg 4개의 등급으로 리스트 분할
  void splitEwgList(list) async {
    // ewg만 추출한 List
    final List<String> ewgList = widget.ingredientList.map((ingredient) {
      final int dashIndex = ingredient.ewg.indexOf('-');
      if (dashIndex != -1) {
        // '-' 이후 문자열 추출
        return ingredient.ewg.substring(dashIndex + 1);
      } else {
        // 그대로 반환
        return ingredient.ewg;
      }
    }).toList();

    // ignore: avoid_function_literals_in_foreach_calls
    ewgList.forEach((e) {
      if (e == '0') {
        undeterminedRisk.add(e);
      } else if (e == '1' || e == '2') {
        lowRiskEwgList.add(e);
      } else if (e == '3' || e == '4' || e == '5' || e == '6') {
        mediumRiskEwgList.add(e);
      } else {
        highRiskEwgList.add(e);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    undeterminedRisk = [];
    lowRiskEwgList = [];
    mediumRiskEwgList = [];
    highRiskEwgList = [];
    // 성분정보 분할
    splitEwgList(widget.ingredientList);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      leading: const CustomBackButton(),
      title: const Text('성분'),
      actions: [
        InkWell(
          onTap: () async {
            // 바텀시트 띄우기
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => const IngredientInfoBottomSheet(),
            );
          },
          child: const Padding(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Icon(Icons.info_outline),
          ),
        ),
      ],
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 34),
              child: IngredientComposition(
                undeterminedRisk: undeterminedRisk.length,
                lowRisk: lowRiskEwgList.length,
                mediumRisk: mediumRiskEwgList.length,
                highRisk: highRiskEwgList.length,
              ),
            ),
            const Divider(
              color: DEEP_LIGHT_GREY_COLOR,
              thickness: 5,
            ),
            const SizedBox(height: 21),
            const Text(
              '전성분',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: TEXT_COLOR,
              ),
            ),
            widget.ingredientList.isNotEmpty
                // 성분 정보가 있는 경우
                ? ListView.separated(
                    controller: controller,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      // ewg만 추출한 List
                      final List<String> ewgList =
                          widget.ingredientList.map((ingredient) {
                        final int dashIndex = ingredient.ewg.indexOf('-');
                        if (dashIndex != -1) {
                          // '-' 이후 문자열 추출
                          return ingredient.ewg.substring(dashIndex + 1);
                        } else {
                          // 그대로 반환
                          return ingredient.ewg;
                        }
                      }).toList();
                      final String ewg = ewgList[index];
                      if (ewg == '0') {
                        color = NO_EWG_COLOR;
                      } else if (ewg == '1' || ewg == '2') {
                        color = LOW_EWG_COLOR;
                      } else if (ewg == '3' ||
                          ewg == '4' ||
                          ewg == '5' ||
                          ewg == '6') {
                        color = MEDIUM_EWG_COLOR;
                      } else {
                        color = HIGH_EWG_COLOR;
                      }
                      return IngredientListTile(
                        color: color,
                        ewg: widget.ingredientList[index].ewg,
                        name: widget.ingredientList[index].korName,
                        purpose: widget.ingredientList[index].blendingPurpose,
                      );
                    },
                    itemCount: widget.ingredientList.length,
                    separatorBuilder: (context, index) => const Divider(
                      color: DEEP_LIGHT_GREY_COLOR,
                      thickness: 1,
                      height: 0,
                    ),
                  )
                // 성분 정보가 없는 경우
                : const Padding(
                    padding: EdgeInsets.only(top: 21.0),
                    child: Text(
                      '성분정보가 없어요 :(',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
            Consumer(
              builder: (context, ref, child) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 34.0),
                child: CustomOutlineTextButton(
                  w: MediaQuery.of(context).size.width,
                  h: 50,
                  content: '성분 정보 수정 요청하기',
                  onPressed: () async {
                    // 성분요청 데이터 table에 넣기
                    showDialog(
                      context: context,
                      builder: (context) => CustomSmallDialog(
                        cancelFun: () async => Navigator.pop(context),
                        cancelText: '아니요',
                        completeText: '보내기',
                        content:
                            '${widget.brand} ${widget.productName}의\n성분 정보를 수정 요청하시겠어요?',
                        completeFun: () async {
                          final ingredientModificationRequestModel =
                              IngredientModificationRequestModel(
                            uid: '',
                            brand: widget.brand,
                            productName: widget.productName,
                            ingredient: '',
                            createdAt: Timestamp.now(),
                          );
                          // 서버에 성분 수정 요청 데이터 저장
                          ref
                              .read(productRepositoryProvider)
                              .requestIngredientModification(
                                  ingredientModificationRequestModel);
                          // 감사 다이얼로그 띄우기
                          showDialog(
                            context: context,
                            builder: (context) {
                              Future.delayed(const Duration(seconds: 2), () {
                                Navigator.of(context).pop();
                              });
                              return const AlertDialog(
                                title: Text(
                                  '소중한 의견 고마워요 :)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                  color: TEXT_COLOR,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
