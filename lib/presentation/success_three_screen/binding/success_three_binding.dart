import '../controller/success_three_controller.dart';
import 'package:get/get.dart';

class SuccessThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuccessThreeController());
  }
}
