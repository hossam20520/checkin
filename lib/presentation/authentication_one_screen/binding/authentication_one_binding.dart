import '../controller/authentication_one_controller.dart';
import 'package:get/get.dart';

class AuthenticationOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationOneController());
  }
}
