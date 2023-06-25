import '../controller/success_two_controller.dart';
import 'package:get/get.dart';

class SuccessTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuccessTwoController());
  }
}
