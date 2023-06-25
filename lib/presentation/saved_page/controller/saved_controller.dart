import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/saved_page/models/saved_model.dart';

import '../../../data/apiClient/api_client.dart';
import '../../../data/models/Hotel/get_hotel_resp.dart';
import '../../home_hotels_container_page/models/HotelsItemModel.dart';

/// A controller class for the SavedPage.
///
/// This class manages the state of the SavedPage, including the
/// current savedModelObj
class SavedController extends GetxController {
  SavedController(this.savedModelObj);

  Rx<SavedModel> savedModelObj;
  HotelsResponse hotelsResponse = HotelsResponse();

  @override
  void onReady() {
    super.onReady();
    fetchHotelsItems();



  }

  @override
  void onClose() {
    super.onClose();
  }
  String token =  Get.find<PrefUtils>().getToken();
  Future<void> callGetHotels() async {

    // ? searchResultsTwoModelObj.value.search.value : parama;
    try {

      hotelsResponse = await Get.find<ApiClient>().GetSavedsHotels(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer  '+ token
          },

      );
      _handleCreateLoginSuccess();
    } on HotelsResponse catch (e) {
      // HotelsResponse = e;
      rethrow;
    }
  }



  void _handleCreateLoginSuccess() {

    final hotelsItems = (hotelsResponse.hotels ?? []).map((hotel) {
      final id = hotel.id?.toInt() ?? 0;
      final price = hotel.price?.toDouble() ?? 0;
      List<String> imageList = hotel.image.toString().split(',');

      String selectedImage;

      if (imageList.length > 1) {
        // Select one image from the list randomly or based on your preferred logic
        selectedImage = imageList[0]; // Selecting the first image
      } else if (imageList.length == 1) {
        selectedImage = imageList[0]; // Only one image available
      } else {
        // No image available
        selectedImage = ""; // or you can set a default image here
      }

      final imageUrl = Constants.imageHotels + selectedImage ?? '';

      final countryCode =   Get.find<PrefUtils>().getLang();



      if(countryCode == "ar"){
        final title = hotel.arName ?? ''; // Provide a default value for nullable strin
        final country = hotel.country?.arName.toString() ?? '';

        return HotelsItemModel(
          image: Rx(imageUrl),
          title: Rx(title),
          country: Rx(country),
          id: Rx(id),
          price: Rx(price),
        );

      }else{
        final title = hotel.enName ?? ''; // Provide a default value for nullable string
        final country = hotel.country?.enName.toString() ?? '';

        return HotelsItemModel(
          image: Rx(imageUrl),
          title: Rx(title),
          country: Rx(country),
          id: Rx(id),
          price: Rx(price),
        );

      }
      // Provide a default value for nullable string




    }).toList();

    savedModelObj.value.savedItemList.value = hotelsItems;

  }



  void fetchHotelsItems() async {

    try {
      await  callGetHotels( );
      // _onLoginSuccess();
    } on HotelsResponse {
      // _onLoginError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      // _onLoginSuccess();
      print(e);
      //TODO: Handle generic errors
    }

  }


}
