import '../controller/choose_lang_controller.dart';
import 'package:get/get.dart';

class ChooseLangBinding extends Bindings {

  void dependencies() {
    Get.lazyPut(() => ChooseLangController());
  }
}
