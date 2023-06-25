import '../controller/success_one_controller.dart';
import 'package:get/get.dart';

class SuccessOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuccessOneController());
  }
}
