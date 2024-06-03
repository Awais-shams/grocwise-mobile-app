import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/base/base_screen.dart';
import 'package:grocery_app/models/response/product_model.dart';
import 'package:grocery_app/src/ui/home/home_vm.dart';
import 'package:grocery_app/src/utils/colors.dart';
import 'package:grocery_app/src/utils/constants.dart';
import 'package:grocery_app/src/utils/dimensions.dart';
import 'package:grocery_app/src/utils/extensions.dart';
import 'package:grocery_app/src/utils/styles.dart';
import 'package:grocery_app/src/widgets/custom_network_image.dart';
import 'package:grocery_app/src/widgets/rounded_card.dart';
import 'package:grocery_app/src/widgets/toolbar.dart';
import 'package:sizer/sizer.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});
  @override
  State<ProductDetailView> createState() => ProductDetailViewContent();
}

class ProductDetailViewContent extends BaseScreen<ProductDetailView, HomeVM>
    with AutomaticKeepAliveClientMixin {
  late ProductModel? product =
      Get.arguments != null ? Get.arguments['product'] : null;
  @override
  void updateKeepAlive() {}

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      width: Get.width,
      height: Get.height,
      color: context.theme.colorScheme.onSurface,
      child: WillPopScope(
        onWillPop: () async {
          goBack();
          return true;
        },
        child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: false,
          backgroundColor: context.theme.colorScheme.onSurface,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ToolBar(
                  screenName: "Product",
                  showStartIcon: true,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircularNetworkImage(
                        url: Constants.DEFAULT_IMAGE,
                        radius: 10,
                        applyRadiusOnBottom: true,
                        height: 20.h,
                        width: Get.width,
                        fit: BoxFit.contain,
                      ),
                      10.marginVertical,
                      Text(product?.productName ?? "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Styles.textStyle(
                            fontSize: Dimensions.TEXT_SIZE_LARGE,
                            fontWeight: FontWeight.w600,
                          )),
                      10.marginVertical,
                      Text("Price",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Styles.textStyle(
                            fontSize: Dimensions.TEXT_SIZE_LARGE,
                            fontWeight: FontWeight.w600,
                          )),
                      10.marginVertical,
                      RoundedCard(
                        borderRadius: 10,
                        color: context.theme.colorScheme.onSurface,
                        sideColor: AppColors.BORDER_COLOR,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    text: "\$${product?.productPrice}",
                                    style: Styles.textStyle(
                                        fontSize: Dimensions.TEXT_SIZE_LARGE,
                                        fontWeight: FontWeight.w500),
                                    children: [
                                      TextSpan(
                                        text: "/Item ",
                                        style: Styles.textStyle(
                                            fontSize:
                                                Dimensions.TEXT_SIZE_SEMI_LARGE,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      10.marginVertical,
                      Text("Description",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Styles.textStyle(
                            fontSize: Dimensions.TEXT_SIZE_LARGE,
                            fontWeight: FontWeight.w600,
                          )),
                      10.marginVertical,
                      Text(product?.productDescription ?? "",
                          style: Styles.textStyle(
                            fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
