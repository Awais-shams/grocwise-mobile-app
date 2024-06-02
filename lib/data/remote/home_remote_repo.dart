import 'package:grocery_app/base/base_remote_repo.dart';
import 'package:grocery_app/models/response/base_response.dart';

class HomeRR extends BaseRemoteRepo {
  // Future<BaseResponse> getSuperData() async {
  //   var response = await get(EndPoints.SUPER_API);
  //   if (response.haveError() == false) {
  //     response.data = SuperData.fromJson(response.data)
  //       ..populateCountryAndStates();
  //   }
  //   return response;
  // }

  // Future<BaseResponse> getDashboard() async {
  //   var response = await get(EndPoints.DASHBOARD_API);
  //   if (response.haveError() == false) {
  //     response.data = Dashboard.fromJson(response.data);
  //   }
  //   return response;
  // }

  // Future<BaseResponse> addPayment(String amount, int cardId, int userId) async {
  //   var response = await post(EndPoints.ADD_PAYMENT, body: {
  //     'userId': userId,
  //     "paymentMethodID": cardId,
  //     "amount": amount,
  //   });
  //   return response;
  // }
}
