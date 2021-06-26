
import 'package:money_manga/core/database/table/_product.dart';

import 'api_responce.dart';

class ProductListResponse extends ApiResponse {
  List<Product>? data;

  ProductListResponse.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    data = [];
    var parsed = map['data']['data'] as List<dynamic>;
    for (var item in parsed) {
      print(item);
      var val = Product.fromJson(item);
      print(val);
      data!.add(val);
    }
    //print("--------->: " + data.length.toString());
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['status'] = status;
    json['message'] = message;
    //json["data"]['data'] = data.;
    return json;
  }
}
