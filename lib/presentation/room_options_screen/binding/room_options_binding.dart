import '../controller/room_options_controller.dart';
import 'package:get/get.dart';

class RoomOptionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoomOptionsController());
  }
}
