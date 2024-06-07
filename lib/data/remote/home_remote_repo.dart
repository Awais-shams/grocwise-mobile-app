import 'package:grocery_app/base/base_remote_repo.dart';
import 'package:grocery_app/main.dart';
import 'package:grocery_app/models/response/product_model.dart';

class HomeRR extends BaseRemoteRepo {
  Future<List<ProductModel>> getSuperData() async {
    print("here");
    final response =
        await supabase.from('combined_products').select('*').limit(10);
    var data = response.map((data) => ProductModel.fromJson(data)).toList();
    return data;
  }
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
