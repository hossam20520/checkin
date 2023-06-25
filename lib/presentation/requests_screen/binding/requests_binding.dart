import '../controller/requests_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RequestsScreen.
///
/// This class ensures that the RequestsController is created when the
/// RequestsScreen is first loaded.
class RequestsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RequestsController());
  }
}
