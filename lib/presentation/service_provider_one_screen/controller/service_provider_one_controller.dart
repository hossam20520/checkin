import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/service_provider_one_screen/models/service_provider_one_model.dart';

/// A controller class for the ServiceProviderOneScreen.
///
/// This class manages the state of the ServiceProviderOneScreen, including the
/// current serviceProviderOneModelObj
class ServiceProviderOneController extends GetxController {
  Rx<ServiceProviderOneModel> serviceProviderOneModelObj =
      ServiceProviderOneModel().obs;



  @override
  void onReady() {
    super.onReady();



  }

  @override
  void onClose() {
    super.onClose();
  }
}
