import 'package:byutinagae/src/common/widget/async_value/custom_error_data.dart';
import 'package:byutinagae/src/common/widget/default_layout/default_layout.dart';
import 'package:byutinagae/src/common/widget/icon_button/custom_back_button.dart';
import 'package:byutinagae/src/common/widget/loading/circular_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:byutinagae/src/features/home/presentation/screen/detail_product_page.dart';
import 'package:byutinagae/src/features/search/presentation/screen/push_search_page.dart';
import 'package:byutinagae/src/features/home/presentation/widget/product_list_item.dart';
import 'package:byutinagae/src/features/home/presentation/provider/product_list_provider.dart';

class ProductListPage extends ConsumerWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController controller = ScrollController();
    final asyncProductList = ref.watch(productListProvider);

    return DefaultLayout(
      leading: const CustomBackButton(),
      title: const Text(
        '샴푸',
      ),
      actions: [
        InkWell(
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PushSearchPage()),
            );
          },
          child: const Padding(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Icon(CupertinoIcons.search),
          ),
        ),
      ],
      body: asyncProductList.when(
        error: (error, stackTrace) => const CustomErrorData(),
        loading: () => const CustomCircularLoading(),
        data: (productList) => ListView.separated(
          itemCount: productList.length,
          controller: controller,
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
                  builder: (context) =>
                      DetailProductPage(productModel: productList[index]),
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
      ),
    );
  }
}
