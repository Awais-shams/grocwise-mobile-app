import 'package:grocery_app/base/base_remote_repo.dart';
import 'package:grocery_app/data/remote/end_points.dart';
import 'package:grocery_app/models/response/base_response.dart';
import 'package:grocery_app/models/response/product_model.dart';

class HomeRR extends BaseRemoteRepo {
  Future<BaseResponse> getSuperData(String text) async {
    final response = await getSupaData(EndPoints.COMBINED_PRODUCTS, text,
        'product_title', 'product_price', true);
    if (response.haveError() == false) {
      response.data =
          response.data.map((data) => ProductModel.fromJson(data)).toList();
    }
    return response;
  }
}
