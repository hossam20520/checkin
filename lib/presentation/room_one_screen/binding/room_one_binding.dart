import '../controller/room_one_controller.dart';
import 'package:get/get.dart';

class RoomOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoomOneController());
  }
}
