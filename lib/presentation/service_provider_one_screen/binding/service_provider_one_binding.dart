import '../controller/service_provider_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ServiceProviderOneScreen.
///
/// This class ensures that the ServiceProviderOneController is created when the
/// ServiceProviderOneScreen is first loaded.
class ServiceProviderOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServiceProviderOneController());
  }
}
