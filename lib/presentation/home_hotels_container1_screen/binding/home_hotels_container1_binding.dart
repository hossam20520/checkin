import '../controller/home_hotels_container1_controller.dart';
import 'package:get/get.dart';

class HomeHotelsContainer1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeHotelsContainer1Controller());
  }
}
