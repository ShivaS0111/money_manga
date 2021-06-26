
import 'package:money_manga/core/network/response/product_list_response.dart';

import '../_result.dart';
import 'base_datasource.dart';

class ProductDataSource extends BaseDataSource {
  Future<Result<ProductListResponse?>> getOfflineProducts(String data) async =>
      await getResult(retroClient.getOfflineProducts(data));
}
