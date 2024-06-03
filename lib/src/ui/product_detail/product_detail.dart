import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/base/base_screen.dart';
import 'package:grocery_app/src/ui/home/home_vm.dart';
import 'package:grocery_app/src/utils/constants.dart';
import 'package:grocery_app/src/utils/utils.dart';
import 'package:grocery_app/src/widgets/custom_network_image.dart';
import 'package:grocery_app/src/widgets/toolbar.dart';
import 'package:sizer/sizer.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});
  @override
  State<ProductDetailView> createState() => ProductDetailViewContent();
}

class ProductDetailViewContent extends BaseScreen<ProductDetailView, HomeVM>
    with AutomaticKeepAliveClientMixin {
  @override
  void updateKeepAlive() {}

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
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
          body: Column(
            children: [
              const ToolBar(
                screenName: "Product",
                showStartIcon: true,
              ),
              const Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
              CircularNetworkImage(
                url: Constants.DEFAULT_IMAGE,
                radius: 10,
                applyRadiusOnBottom: true,
                height: 20.h,
                width: Get.width,
                fit: BoxFit.contain,
              )
            ],
          ),
        ),
      ),
    );
  }
}
