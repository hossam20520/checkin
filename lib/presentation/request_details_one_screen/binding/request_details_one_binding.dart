import '../controller/request_details_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RequestDetailsOneScreen.
///
/// This class ensures that the RequestDetailsOneController is created when the
/// RequestDetailsOneScreen is first loaded.
class RequestDetailsOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RequestDetailsOneController());
  }
}
