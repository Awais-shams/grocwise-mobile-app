import 'package:grocery_app/base/base_view_model.dart';
import 'package:grocery_app/base/base_view_model_listener.dart';
import 'package:grocery_app/data/remote/home_remote_repo.dart';
import 'package:grocery_app/models/response/product_model.dart';
import 'package:grocery_app/src/services/services.dart';

class HomeVM extends BaseViewModel<HomeVMListeners> {
  final HomeRR homeRR = HomeRR();

  List<ProductModel> products = [];

  getProducts(String query) {
    isLoading = true;
    showErrorMessage = false;
    notifyListeners();
    fetchData<List<dynamic>>(
      abortOnNoInternet: true,
      remoteMethod: () => homeRR.getSuperData(query),
      notifyOnEnd: true,
      showDialogOnError: false,
      onError: (error, statusCode) {
        isLoading = false;
        showErrorMessage = true;
      },
      onSuccess: (superData) {
        isLoading = false;
        products = superData.whereType<ProductModel>().toList();
      },
    );
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
