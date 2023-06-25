import '../controller/payment_web_controller.dart';
import 'package:get/get.dart';

class PaymentWebBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentWebController());
  }
}
