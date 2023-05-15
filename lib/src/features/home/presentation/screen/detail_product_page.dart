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
import 'package:byutinagae/src/features/home/presentation/provider/detail_product_provider.dart';

class DetailProductPage extends ConsumerWidget {
  final String id;
  const DetailProductPage({required this.id, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productDetailProvider(id));
    final ingredient = ref.watch(ingredientProvider(id));

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
      body: product.when(
        error: (error, stackTrace) => const CustomErrorData(),
        loading: () => const CustomCircularLoading(),
        data: (product) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 제품 사진
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Image.network(
                  product.fullImage,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 21),
              ProductDetailBox(
                brand: product.brand,
                price: product.price,
                productName: product.productName,
                volume: product.volume,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 21.0),
                child: Divider(
                  color: DEEP_LIGHT_GREY_COLOR,
                  thickness: 3,
                ),
              ),
              ingredient.when(
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
                          int.tryParse(result) != null &&
                          int.parse(result) >= 3)
                      .toList();
                  return ProductIngredientBox(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IngredientListPage(
                            ingredientList: ingredientList,
                            productName: product.productName,
                            brand: product.brand,
                          ),
                        ),
                      );
                    },
                    totalIngredient: ingredientList.length,
                    riskIngredient: ewgRiskList.length,
                  );
                },
                error: (error, stackTrace) => const Center(
                  child: Text('에러입니다'),
                ),
                loading: () => const CustomCircularLoading(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
