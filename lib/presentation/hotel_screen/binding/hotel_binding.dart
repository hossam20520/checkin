import '../controller/hotel_controller.dart';
import 'package:get/get.dart';

class HotelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HotelController());
  }
}
