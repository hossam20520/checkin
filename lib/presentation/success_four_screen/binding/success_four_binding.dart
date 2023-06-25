import '../controller/success_four_controller.dart';
import 'package:get/get.dart';

class SuccessFourBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuccessFourController());
  }
}
