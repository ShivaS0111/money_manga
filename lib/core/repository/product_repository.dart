
import 'package:get/get.dart';
import 'package:money_manga/core/database/dao/product_dao.dart';
import 'package:money_manga/core/database/table/_product.dart';
import 'package:money_manga/core/enums/status.dart';
import 'package:money_manga/core/network/datasource/product_datasource.dart';

class ProductRepository {

  final ProductDataSource _productDataSource =  Get.find<ProductDataSource>();
  final ProductDao _productDao =  Get.find<ProductDao>();

  Future<List<Product>?> getOfflineProducts(String data) async {
    var resp = await _productDataSource.getOfflineProducts(data);
    if (resp.status == Status.SUCCESS) {
      //_productDao.insertProducts( resp.data.data);
    }
    return null;
  }
}
