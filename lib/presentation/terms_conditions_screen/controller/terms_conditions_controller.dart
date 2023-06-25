import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/terms_conditions_screen/models/terms_conditions_model.dart';

import '../../../data/apiClient/api_client.dart';
import '../../../data/models/About/about_resp.dart';

/// A controller class for the TermsConditionsScreen.
///
/// This class manages the state of the TermsConditionsScreen, including the
/// current termsConditionsModelObj
class TermsConditionsController extends GetxController {
  Rx<TermsConditionsModel> termsConditionsModelObj = TermsConditionsModel().obs;

  AboutResp aboutResp  = AboutResp();
  @override
  Future<void> onReady() async {
    super.onReady();

    try {
      await  CallGetAbout();
      // _onGetHotelSuccess();
    } on AboutResp {
      // _onGetHotelError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      // _onGetHotelError();
      print(e);
      //TODO: Handle generic errors
    }

  }

  @override
  void onClose() {
    super.onClose();
  }


  Future<void> CallGetAbout() async {

    try {
      aboutResp = await Get.find<ApiClient>().GetAbout(
        headers: {
          'Content-Type': 'application/json',
        },


      );
      _handleGetRoomSuccess();

    } on AboutResp catch (e) {
      // HotelsResponse = e;

      rethrow;
    }
  }




  void _handleGetRoomSuccess() {
    final language =   Get.find<PrefUtils>().getLang();

    if(language == "ar"){
      termsConditionsModelObj.value.about.value = aboutResp.ar_about.toString();
      termsConditionsModelObj.value.term.value = aboutResp.ar_term.toString();

    }else{

      termsConditionsModelObj.value.term.value = aboutResp.en_term.toString();
      termsConditionsModelObj.value.about.value = aboutResp.en_about.toString();
    }






  }


  void _onGetHotelSuccess() {}
  void _onGetHotelError() {}


}
