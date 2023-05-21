import 'package:byutinagae/src/common/widget/async_value/custom_error_data.dart';
import 'package:byutinagae/src/common/widget/default_layout/default_layout.dart';
import 'package:byutinagae/src/common/widget/icon_button/custom_back_button.dart';
import 'package:byutinagae/src/common/widget/loading/circular_loading.dart';
import 'package:byutinagae/src/features/home/presentation/provider/ingredient_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:byutinagae/src/features/home/presentation/screen/ingredient_list_page.dart';
import 'package:byutinagae/src/features/search/presentation/screen/push_search_page.dart';
import 'package:byutinagae/src/features/home/presentation/widget/detail_product_box.dart';
import 'package:byutinagae/src/features/home/presentation/widget/product_ingredient.dart';

class DetailProductPage extends ConsumerWidget {
  // 타입 지정을 하지 않은 이유
  // 검색 제품 리스트랑 그냥 탑생 제품 리스트 타입이 다르기 때문이다.
  final productModel;
  const DetailProductPage({required this.productModel, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncIngredientList =
        ref.watch(ingredientListProvider(productModel.id));

    return DefaultLayout(
      leading: const CustomBackButton(),
      actions: [
        InkWell(
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PushSearchPage(),
              ),
            );
          },
          child: const Padding(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Icon(CupertinoIcons.search),
          ),
        ),
      ],
      body: asyncIngredientList.when(
        error: (error, stackTrace) => const CustomErrorData(),
        loading: () => const CustomCircularLoading(),
        data: (ingredientList) {
          final List<String> ewgList = ingredientList.map((ingredient) {
            final int dashIndex = ingredient.ewg.indexOf('-');
            if (dashIndex != -1) {
              // '-' 이후 문자열 추출
              return ingredient.ewg.substring(dashIndex + 1);
            } else {
              // 그대로 반환
              return ingredient.ewg;
            }
          }).toList();

          final List<String> ewgRiskList = ewgList
              .where((result) =>
                  int.tryParse(result) != null && int.parse(result) >= 3)
              .toList();

          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 제품 사진
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Image.network(
                    productModel.fullImage,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 21),
                ProductDetailBox(
                  brand: productModel.brand,
                  price: productModel.price,
                  productName: productModel.productName,
                  volume: productModel.volume,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 21.0),
                  child: Divider(
                    color: DEEP_LIGHT_GREY_COLOR,
                    thickness: 3,
                  ),
                ),
                ProductIngredientBox(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IngredientListPage(
                                  ingredientList: ingredientList,
                                  productName: productModel.productName,
                                  brand: productModel.brand,
                                )));
                  },
                  totalIngredient: ingredientList.length,
                  riskIngredient: ewgRiskList.length,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
