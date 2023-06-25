import '../controller/account_type_controller.dart';
import 'package:get/get.dart';

class AccountTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountTypeController());
  }
}
