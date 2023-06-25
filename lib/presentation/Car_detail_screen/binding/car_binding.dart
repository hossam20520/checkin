import '../controller/car_controller.dart';
import 'package:get/get.dart';

class CarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CarController());
  }
}
