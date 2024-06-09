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
import 'package:grocery_app/src/utils/utils.dart';
import 'package:grocery_app/src/widgets/custom_network_image.dart';
import 'package:grocery_app/src/widgets/rounded_card.dart';
import 'package:grocery_app/src/widgets/toolbar.dart';

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
      color: context.theme.colorScheme.primary,
      child: SafeArea(
        bottom: !Utils.needSaveArea(),
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
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Material(
                          elevation: 5.0,
                          shadowColor: Colors.grey,
                          borderRadius: BorderRadius.circular(20.0),
                          child: CircularNetworkImage(
                            url: product?.productImage,
                            radius: 10,
                            applyRadiusOnBottom: true,
                            height: 250,
                            width: Get.width,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              10.marginVertical,
                              Text(
                                  product?.productName
                                          ?.removeFirstWord()
                                          .capitalizeFirstLetter() ??
                                      "",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: Styles.textStyle(
                                    fontSize: Dimensions.TEXT_SIZE_LARGE,
                                    fontWeight: FontWeight.w600,
                                  )),
                              10.marginVertical,
                              RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  text: "Brand: ",
                                  style: Styles.textStyle(
                                      fontSize: Dimensions.TEXT_SIZE_MEDIUM,
                                      fontWeight: FontWeight.w500),
                                  children: [
                                    TextSpan(
                                      text: product?.source
                                              ?.capitalizeFirstLetter() ??
                                          "",
                                      style: TextStyle(
                                        fontSize: Dimensions.TEXT_SIZE_NORMAL,
                                        color:
                                            context.theme.colorScheme.tertiary,
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                                elevation: 10,
                                color: context.theme.colorScheme.onSurface,
                                sideColor: AppColors.BORDER_COLOR,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 15, right: 20, bottom: 15),
                                  child: RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      text: product?.productPrice,
                                      style: Styles.textStyle(
                                          fontSize: Dimensions.TEXT_SIZE_LARGE,
                                          fontWeight: FontWeight.w500),
                                      children: [
                                        TextSpan(
                                          text: " /Item ",
                                          style: Styles.textStyle(
                                              fontSize: Dimensions
                                                  .TEXT_SIZE_SEMI_LARGE,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              10.marginVertical,
                              SizedBox(
                                height: 50,
                                width: 105,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      bottom:
                                          2, // Adjust this value to change the space between text and underline
                                      child: Text("Description",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: Styles.textStyle(
                                            fontSize:
                                                Dimensions.TEXT_SIZE_LARGE,
                                            fontWeight: FontWeight.w600,
                                          )),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        height: 2, // Thickness of the underline
                                        color: Colors
                                            .black, // Color of the underline
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              10.marginVertical,
                              Text(Constants.DEFAULT_TEXT,
                                  textAlign: TextAlign.justify,
                                  style: Styles.textStyle(
                                    fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
