import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/search_results_two_screen/models/search_results_two_model.dart';

import '../../../data/apiClient/api_client.dart';
import '../../../data/models/Hotel/get_hotel_resp.dart';
import '../../home_hotels_container_page/models/HotelsItemModel.dart';

class SearchResultsTwoController extends GetxController {
  Rx<SearchResultsTwoModel> searchResultsTwoModelObj = SearchResultsTwoModel().obs;
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

        final parama = Get.arguments;


  Future<void> callGetHotels() async {

     // ? searchResultsTwoModelObj.value.search.value : parama;
    try {

      hotelsResponse = await Get.find<ApiClient>().GetHotels(
          headers: {
            'Content-Type': 'application/json',
          },
          requestData: {
            'SortField': 'id',
            'SortType': 'desc',
            'search': searchResultsTwoModelObj.value.search.value,
            'limit': 1000,
            'page':1
          }
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
      final imageUrl = Constants.imageHotels + hotel.image.toString() ?? '';
      final countryCode = Constants.language();
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

    searchResultsTwoModelObj.value.HotelsItems.value = hotelsItems;

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
