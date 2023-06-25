import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/service_provider_screen/models/service_provider_model.dart';

/// A controller class for the ServiceProviderScreen.
///
/// This class manages the state of the ServiceProviderScreen, including the
/// current serviceProviderModelObj
class ServiceProviderController extends GetxController {
  Rx<ServiceProviderModel> serviceProviderModelObj = ServiceProviderModel().obs;



  @override
  void onReady() {
    super.onReady();



  }

  @override
  void onClose() {
    super.onClose();
  }


}
