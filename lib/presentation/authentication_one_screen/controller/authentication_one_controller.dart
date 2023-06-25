import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/authentication_one_screen/models/authentication_one_model.dart';

class AuthenticationOneController extends GetxController {
  Rx<AuthenticationOneModel> authenticationOneModelObj =
      AuthenticationOneModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
