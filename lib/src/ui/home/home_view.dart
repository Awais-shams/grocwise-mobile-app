import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/base/base_screen.dart';
import 'package:grocery_app/models/response/product_model.dart';
import 'package:grocery_app/src/navigation/routes.dart';
import 'package:grocery_app/src/ui/home/home_vm.dart';
import 'package:grocery_app/src/utils/colors.dart';
import 'package:grocery_app/src/utils/dimensions.dart';
import 'package:grocery_app/src/utils/extensions.dart';
import 'package:grocery_app/src/utils/styles.dart';
import 'package:grocery_app/src/widgets/custom_network_image.dart';
import 'package:grocery_app/src/widgets/input_field.dart';
import 'package:grocery_app/src/widgets/no_data_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomeViewContent();
}

class HomeViewContent extends BaseScreen<HomeView, HomeVM>
    with AutomaticKeepAliveClientMixin, HomeVMListeners {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel?.refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ColoredBox(
      color: context.theme.colorScheme.onSurface,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            InputField(
              hintText: 'Search products...',
              paddingVertical: 15,
              radius: 10,
              onTapOutside: () => Get.focusScope?.unfocus(),
              onChange: (value) => {},
              endIcon: Icon(
                Icons.clear,
                color: context.theme.colorScheme.onInverseSurface,
                size: 25,
              ),
            ),
            20.marginVertical,
            Expanded(
              child: Consumer<HomeVM>(
                builder: (context, value, child) {
                  return value.products.isEmpty == true
                      ? const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: NoDataWidget())
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: value.products.length,
                          padding: EdgeInsets.zero,
                          separatorBuilder: (context, index) =>
                              25.marginVertical,
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  gotoScreen(Routes.PRODUCT_DETAIL);
                                },
                                child: _getItem(index, value.products[index]),
                              ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getItem(int index, ProductModel product) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 60.0, // Minimum height
        maxHeight: 120.0, // Maximum height
      ),
      child: IntrinsicHeight(
        child: Container(
          width: 100.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: Styles.getStaticBoxShadow(),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircularNetworkImage(
                      width: 100,
                      height: 100,
                      url: product.productImage,
                      fit: BoxFit.contain,
                      radius: 2,
                    ),
                    10.marginHorizontal,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.productName ?? "",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: Dimensions.TEXT_SIZE_LARGE,
                              color: AppColors.SECONDARY_COLOR,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          5.marginVertical,
                          Text(
                            product.productDiscription ?? "",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: Dimensions.TEXT_SIZE_SMALL,
                              color: AppColors.TEXT_DISCRIPTION_COLOR,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          5.marginVertical,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${product.productPrice ?? ""}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
                                  color: AppColors.SECONDARY_COLOR,
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              10.marginHorizontal,
                              Expanded(
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      product.productQuantity ?? "",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: Dimensions.TEXT_SIZE_NORMAL,
                                        color:
                                            context.theme.colorScheme.tertiary,
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          10.marginVertical,
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void updateKeepAlive() {}

  @override
  bool get wantKeepAlive => true;
}
