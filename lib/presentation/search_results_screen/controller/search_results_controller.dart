import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/search_results_screen/models/search_results_model.dart';

import '../../../data/apiClient/api_client.dart';
import '../../../data/models/Car/get_cars_resp.dart';
import '../../home_cars_page/models/home_cars_item_model.dart';
import '../models/searchresults1_item_model.dart';

class SearchResultsController extends GetxController {
  Rx<SearchResultsModel> searchResultsModelObj = SearchResultsModel().obs;

  @override
  void onReady() {
    super.onReady();
    fetchCarsItems();
  }

  @override
  void onClose() {
    super.onClose();
  }


  CarsResp carssResponse = CarsResp();


  Future<void> callGetCars() async {
    try {
      carssResponse = await Get.find<ApiClient>().GetCars(
          headers: {
            'Content-Type': 'application/json',
          },
          requestData: {
            'SortField': 'id',
            'SortType': 'desc',
            'search':  '',
            'limit': 5,
            'page':1
          }
      );
      _handleGetCarSuccess();
    } on CarsResp catch (e) {
      // HotelsResponse = e;
      rethrow;
    }
  }




  void _handleGetCarSuccess() {

    final CarsItems = (carssResponse.cars ?? []).map((car) {
      print(car.image);
      String price = car.priceperday.toString();
      String iamge = Constants.cars + car.image.toString();
      String cartype =   car.cartype.toString();
      String id = car.id.toString();
      final countryCode =   Get.find<PrefUtils>().getLang();
      String title =  "";
      if (countryCode == 'ar') {
        title = car.arName.toString();
      }else{
        title = car.enName.toString();
      }

      return Searchresults1ItemModel(id:Rx(id) ,

          title: Rx(title) , price: Rx(price), image: Rx(iamge), carType: Rx(cartype)

      );

    }).toList();

    searchResultsModelObj.value.searchresults1ItemList.value = CarsItems;


  }


  void fetchCarsItems() async {

    try {
      await  callGetCars( );
      // _onLoginSuccess();
    } on CarsResp {
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
