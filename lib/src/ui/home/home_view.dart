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
import 'package:grocery_app/src/widgets/circular_button.dart';
import 'package:grocery_app/src/widgets/custom_network_image.dart';
import 'package:grocery_app/src/widgets/input_field.dart';
import 'package:grocery_app/src/widgets/no_data_widget.dart';
import 'package:grocery_app/src/widgets/rounded_card.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomeViewContent();
}

class HomeViewContent extends BaseScreen<HomeView, HomeVM>
    with AutomaticKeepAliveClientMixin, HomeVMListeners {
  late final TextEditingController _inputController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //viewModel?.refresh("");
      viewModel?.getProducts("");
    });
  }

  Future<void> _refresh() async {
    // Simulate a fetch operation
    await Future.delayed(const Duration(seconds: 2));
    // Add new data or update existing data here
    viewModel?.getProducts("");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ColoredBox(
      color: Get.theme.colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Material(
              elevation: 5.0,
              shadowColor: Colors.grey,
              borderRadius: BorderRadius.circular(8.0),
              child: InputField(
                controller: _inputController,
                hintText: 'Search products...',
                paddingVertical: 15,
                radius: 10,
                inputFieldFillColor: Get.theme.colorScheme.onSurface,
                borderColor: Get.theme.colorScheme.secondary,
                onEndIconClicked: () {
                  _inputController.clear();
                  viewModel?.getProducts("");
                },
                onTapOutside: () => Get.focusScope?.unfocus(),
                onChange: (value) => {viewModel?.getProducts(value)},
                endIcon: Icon(
                  Icons.clear,
                  color: context.theme.colorScheme.onInverseSurface,
                  size: 25,
                ),
              ),
            ),
            20.marginVertical,
            Expanded(
                child: RefreshIndicator(
                    onRefresh: _refresh,
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
                                    5.marginVertical,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    gotoScreen(Routes.PRODUCT_DETAIL,
                                        arguments: {
                                          'product': value.products[index],
                                        });
                                  },
                                  child: _getItem(index, value.products[index]),
                                ),
                              );
                      },
                    ))),
          ],
        ),
      ),
    );
  }

  _getItem(int index, ProductModel product) {
    return RoundedCard(
      elevation: 10,
      shadowColor: context.theme.colorScheme.outline,
      borderRadius: 10,
      color: context.theme.colorScheme.onSurface,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 60.0, // Minimum height
            maxHeight: 190.0, // Maximum height
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircularNetworkImage(
                        width: 100,
                        height: 100,
                        url: product.productImage,
                        fit: BoxFit.scaleDown,
                        radius: 2,
                      ),
                      10.marginHorizontal,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: AppColors.GREEN_PROGRESS,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                product.productPrice ?? "",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: context.theme.colorScheme.onSurface,
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            10.marginVertical,
                            Text(
                              product.productName
                                      ?.removeFirstWord()
                                      .capitalizeFirstLetter() ??
                                  "",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: Dimensions.TEXT_SIZE_SEMI_LARGE,
                                color: AppColors.SECONDARY_COLOR,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            5.marginVertical,
                            RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                text: "Category: ",
                                style: Styles.textStyle(
                                    fontSize: Dimensions.TEXT_SIZE_MEDIUM,
                                    color: context.theme.colorScheme.primary,
                                    fontWeight: FontWeight.w500),
                                children: [
                                  TextSpan(
                                    text: product.categoryTitle
                                            ?.capitalizeFirstLetter() ??
                                        "",
                                    style: TextStyle(
                                      fontSize: Dimensions.TEXT_SIZE_NORMAL,
                                      color: context.theme.colorScheme.tertiary,
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            15.marginVertical,
                            CircularButton(
                              height: 40,
                              rectangle: true,
                              borderRadius: 0,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              title: product.source?.toUpperCase() ?? "",
                              color: context.theme.colorScheme.primary,
                            )
                          ],
                        ),
                      ),
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

  @override
  void updateKeepAlive() {}

  @override
  bool get wantKeepAlive => true;
}
