import 'package:checkin/core/app_export.dart';
import 'package:checkin/data/models/About/about_resp.dart';
import 'package:checkin/presentation/about_us_screen/models/about_us_model.dart';

import '../../../data/apiClient/api_client.dart';

/// A controller class for the AboutUsScreen.
///
/// This class manages the state of the AboutUsScreen, including the
/// current aboutUsModelObj
class AboutUsController extends GetxController {
  Rx<AboutUsModel> aboutUsModelObj = AboutUsModel().obs;

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
      aboutUsModelObj.value.about.value = aboutResp.ar_about.toString();
      aboutUsModelObj.value.term.value = aboutResp.ar_term.toString();

    }else{

      aboutUsModelObj.value.term.value = aboutResp.en_term.toString();
      aboutUsModelObj.value.about.value = aboutResp.en_about.toString();
    }






  }


  void _onGetHotelSuccess() {}
  void _onGetHotelError() {}


}
