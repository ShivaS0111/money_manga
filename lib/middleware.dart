
import 'package:get/get.dart';
import 'package:money_manga/utils/logger.dart';

class MiddleWare {
  static observer(Routing routing) {
    /*if (routing.current == '/second' ) {
      Get.snackbar("Hi", "You are on second route");
    } else if (routing.current =='/third'){
      print('last route called');
    }*/
    InviaLog.d(tag:"Route", message: routing.current);
  }
}