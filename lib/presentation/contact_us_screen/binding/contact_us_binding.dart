import '../controller/contact_us_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ContactUsScreen.
///
/// This class ensures that the ContactUsController is created when the
/// ContactUsScreen is first loaded.
class ContactUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactUsController());
  }
}
