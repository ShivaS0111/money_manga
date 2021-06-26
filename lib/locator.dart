import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'core/database/database.dart';
import 'core/network/datasource/git_datasource.dart';
import 'core/network/datasource/product_datasource.dart';
import 'core/network/retrofit_client.dart';
import 'core/repository/git_repository.dart';


Future<void> setupLocator() async {

  Get.put( Dio() );
  Get.put( RestClient(Get.find<Dio>()) );
  Get.put( GitDataSource() );
  Get.put( GitRepository() );
}
