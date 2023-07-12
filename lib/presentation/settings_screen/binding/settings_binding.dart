import '../controller/settings_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NotificationsScreen.
///
/// This class ensures that the NotificationsController is created when the
/// NotificationsScreen is first loaded.
class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController());
  }
}
