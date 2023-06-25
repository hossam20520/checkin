import 'package:checkin/core/app_export.dart';
import 'package:checkin/data/models/Book/MyBooks.dart';
import 'package:checkin/presentation/bookings_page/models/bookings_model.dart';

import '../../../data/apiClient/api_client.dart';
import '../models/bookings_item_model.dart';

/// A controller class for the BookingsPage.
///
/// This class manages the state of the BookingsPage, including the
/// current bookingsModelObj
class BookingsController extends GetxController {
  BookingsController(this.bookingsModelObj);

  Rx<BookingsModel> bookingsModelObj;



  @override
  void onReady() {
    super.onReady();
    fetchCarsItems();
  }

  @override
  void onClose() {
    super.onClose();
  }


  MyBooks myBooks = MyBooks();

  String token =  Get.find<PrefUtils>().getToken();
  Future<void> CallGetMyBooks() async {
    try {
      myBooks = await Get.find<ApiClient>().GetMyBooks(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer  '+ token
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
    } on MyBooks catch (e) {
      // HotelsResponse = e;
      rethrow;
    }
  }




  void _handleGetCarSuccess() {


    final mybooksitesm = (myBooks.mybooks ?? []).map((item) {

   String title = item.title.toString();
   String type = item.type.toString();
   String image;
   if(type == "car"){
      image =  Constants.cars + item.image.toString();
   }else if (type == "room"){
     image =  Constants.imageRooms + item.image.toString();
   }else {
     image =  Constants.flights + item.image.toString();
   }



   String price = item.price.toString();



      return BookingsItemModel(title: Rx(title) , type: Rx(type), image: Rx(image) , price: Rx(price) );

    }).toList();


    bookingsModelObj.value.bookingsItemList.value = mybooksitesm;


  }


  void fetchCarsItems() async {

    try {
      await  CallGetMyBooks( );
      // _onLoginSuccess();
    } on MyBooks {
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
