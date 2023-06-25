import 'package:get/get_rx/src/rx_types/rx_types.dart';

/// This class defines the variables used in the [profile_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ProfileModel {
  Rx<String> name = Rx("");
  Rx<String> lastname = Rx("");
  Rx<String> email = Rx("");
  Rx<String> username = Rx("");
  Rx<String> phone = Rx("");
  Rx<String> image = Rx("");
}
