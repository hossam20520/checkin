import '../controller/service_provider_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ServiceProviderScreen.
///
/// This class ensures that the ServiceProviderController is created when the
/// ServiceProviderScreen is first loaded.
class ServiceProviderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServiceProviderController());
  }
}
