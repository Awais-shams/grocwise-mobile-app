import 'package:grocery_app/base/base_remote_repo.dart';
import 'package:grocery_app/models/response/base_response.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRR extends BaseRemoteRepo {
  //final SupabaseClient supabaseClient = Supabase.instance.client;
  // Future<BaseResponse> getSuperData() async {
  //   final response = await supabaseClient
  //       .from('items')
  //       .select()
  //       .limit(30)
  //       .execute();
  //   if (response.haveError() == false) {
  //     response.data = SuperData.fromJson(response.data)
  //       ..populateCountryAndStates();
  //   }
  //   return response;
  // }
  //  final response = await supabase
  //       .from('items')
  //       .select()
  //       .limit(limit)
  //       .execute();

  //   if (response.error == null) {
  //     return response.data as List<dynamic>;
  //   } else {
  //     throw Exception('Failed to fetch items');
  //   }
}
