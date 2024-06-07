import 'package:grocery_app/base/base_view_model.dart';
import 'package:grocery_app/base/base_view_model_listener.dart';
import 'package:grocery_app/data/remote/home_remote_repo.dart';
import 'package:grocery_app/models/response/product_model.dart';
import 'package:grocery_app/src/services/services.dart';

class HomeVM extends BaseViewModel<HomeVMListeners> {
  final HomeRR homeRR = HomeRR();

  List<ProductModel> products = [];
  var product = ProductModel(
      productId: 1,
      productName: "Product Name",
      productDescription:
          "Lorem Ipsum is simply dummy text of the printing and type setting lorem Ipsum.",
      productImage:
          "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSYj-vikGnJNyxtRFw3wG7J6fdo43Wfs8J196yHIukwqfj24W3m",
      productPrice: "200",
      productQuantity: "2 Container",
      categoryTitle: "food cupboard");
  Future refresh() async {
    products = await homeRR.getSuperData();
    print("Products:: $products");
    // products.add(product);
    // products.add(product);
    // products.add(product);
    // products.add(product);
    // products.add(product);
    // products.add(product);
    notifyListeners();
  }

  dataFailed() {
    LoaderService.hideLoader();
    isLoading = false;
    showErrorMessage = true;
    notifyListeners();
  }
}

mixin HomeVMListeners on BaseVMlListeners {
  onRefreshSuccess() {}
}
