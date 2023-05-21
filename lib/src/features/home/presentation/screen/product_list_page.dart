import 'package:byutinagae/src/common/widget/default_layout/default_layout.dart';
import 'package:byutinagae/src/common/widget/icon_button/custom_back_button.dart';
import 'package:byutinagae/src/common/widget/loading/circular_loading.dart';
import 'package:byutinagae/src/features/home/domain/model/product_model.dart';
import 'package:byutinagae/src/features/home/presentation/provider/product_list_provider.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:byutinagae/src/features/home/presentation/screen/detail_product_page.dart';
import 'package:byutinagae/src/features/search/presentation/screen/push_search_page.dart';
import 'package:byutinagae/src/features/home/presentation/widget/product_list_item.dart';

class ProductListPage extends ConsumerWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController controller = ScrollController();
    final paginatedProductList = ref.watch(paginatedProductListProvider);

    return DefaultLayout(
      leading: const CustomBackButton(),
      title: const Text('샴푸'),
      actions: [
        InkWell(
            onTap: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PushSearchPage()));
            },
            child: const Padding(
                padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Icon(CupertinoIcons.search))),
      ],
      body: FirestoreQueryBuilder<ProductModel>(
        query: paginatedProductList,
        builder: (context, snapshot, child) {
          if (snapshot.isFetching) {
            // 로딩
            return const CustomCircularLoading();
          } else if (snapshot.hasError) {
            // 에러
            return Text('error ${snapshot.error}');
          } else if (snapshot.docs.isEmpty) {
            // 빈 데이터인 경우
            return const Text('텅비었개');
          }
          return ListView.separated(
            itemCount: snapshot.docs.length,
            controller: controller,
            separatorBuilder: (context, index) => const Divider(
                color: DEEP_LIGHT_GREY_COLOR, thickness: 1, height: 0),
            itemBuilder: (context, index) {
              final ProductModel productModel = snapshot.docs[index].data();
              // fetch 묶음 데이터의 마지막 순번인 경우 값 더 받기
              if (snapshot.hasMore && (index + 1 == snapshot.docs.length)) {
                snapshot.fetchMore();
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
      ),
    );
  }
}
