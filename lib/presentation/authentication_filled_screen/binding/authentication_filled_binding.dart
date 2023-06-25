import '../controller/authentication_filled_controller.dart';
import 'package:get/get.dart';

class AuthenticationFilledBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationFilledController());
  }
}
