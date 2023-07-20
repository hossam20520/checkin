import 'package:checkin/core/app_export.dart';
import 'package:checkin/core/utils/progress_dialog_utils.dart';
import 'package:checkin/data/models/Book/MyBooks.dart';
import 'package:checkin/data/models/Book/RoomReqResp.dart';
import 'package:checkin/data/models/BookProvider/change_request_book_resp.dart';
import 'package:checkin/data/models/Car/get_car_resp.dart';
import 'package:checkin/data/models/Car/get_cars_resp.dart';
import 'package:checkin/data/models/Flight/Flight_detail_resp.dart';
import 'package:checkin/data/models/Flight/flight_response.dart';
import 'package:checkin/data/models/login/post_login_resp.dart';
import 'package:checkin/data/models/password/post_passowrd_resp.dart';
import 'package:checkin/data/models/register/post_register_resp.dart';

import '../models/About/about_resp.dart';
import '../models/Book/RequestsResponse.dart';
import '../models/Book/book_response.dart';
import '../models/Country/CountryResp.dart';
import '../models/Hotel/get_hotel_detail.dart';
import '../models/Hotel/get_hotel_resp.dart';
import '../models/Notification/NotiResp.dart';
import '../models/Room/get_room_resp.dart';
import '../models/Room/get_rooms_resp.dart';
// import 'package:logger/logger.dart';


class ApiClient extends GetConnect {
  // var url = "http://192.168.1.7:8000";
  var url = Constants.BaseUrl;
  @override
  void onInit() {
    super.onInit();
    httpClient.timeout = Duration(seconds: 80);
  }

  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!await Get.find<NetworkInfo>().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  /// is `true` when the response status code is between 200 and 299
  ///
  /// user can modify this method with custom logics based on their API response
  bool _isSuccessCall(Response response) {
    return response.isOk;
  }




  Future<PostPasswordResp> ResetPassword({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
        '$url/api/device/auth/passowrd/reset/user',
        headers: headers,
        body: requestData,
      );


      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {

        return PostPasswordResp.fromJson(response.body);
      } else {


        throw response.body != null

            ? PostPasswordResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }



  Future<PostPasswordResp> ChangePassword({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
        '$url/api/device/auth/password/change',
        headers: headers,
        body: requestData,
      );


      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {

        return PostPasswordResp.fromJson(response.body);
      } else {


        throw response.body != null

            ? PostPasswordResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }



  Future<CountryResp> GetCountries({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.get(
        '$url/api/device/countries',
        headers: headers,

      );
      Logger.PretteyLogger(response.body);

      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {

        return CountryResp.fromJson(response.body);
      } else {


        throw response.body != null

            ? CountryResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }




  Future<PostPasswordResp> ChangeProfile({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
        '$url/api/device/auth/profile/update',
        headers: headers,
        body: requestData,
      );
     Logger.PretteyLogger(response.body);

      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {

        return PostPasswordResp.fromJson(response.body);
      } else {


        throw response.body != null

            ? PostPasswordResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }


  Future<NotificationResp> GetNotifications({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.get(
        '$url/api/device/noti',
        headers: headers,

      );


      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {

        return NotificationResp.fromJson(response.body);
      } else {


        throw response.body != null

            ? NotificationResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }





  Future<changeResponse> ChangeRequest({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
        '$url/api/device/book/request',
        headers: headers,
        body: requestData,
      );


      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {

        return changeResponse.fromJson(response.body);
      } else {


        throw response.body != null

            ? changeResponse.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }







  Future<PostLoginResp> createLogin({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
        '$url/api/device/auth/login',
        headers: headers,
        body: requestData,
      );

      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {

        return PostLoginResp.fromJson(response.body);
      } else {


        throw response.body != null

            ? PostLoginResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<PostRegisterResp> createRegister({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
        '$url/api/device/auth/register',
        headers: headers,
        body: requestData,
      );

      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostRegisterResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostRegisterResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }




  Future<PostLoginResp> LoginWithSocal({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
        '$url/api/device/auth/social',
        headers: headers,
        body: requestData,
      );

      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostLoginResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostLoginResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }





  Future<PostPasswordResp> SavFav({
    Map<String, String> headers = const {},
    Map requestData = const {},


  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();

      String queryParams = '';

      if (requestData.isNotEmpty) {
        List<String> queryParamList = requestData.entries.map((entry) {
          final key = Uri.encodeQueryComponent(entry.key);
          final value = Uri.encodeQueryComponent(entry.value.toString());
          return '$key=$value';
        }).toList();

        queryParams = '?' + queryParamList.join('&');
      }
      // $queryParams
      // '$url/api/device/hotels?page=1&ar_name=&en_name=&phone_number=&SortField=id&SortType=desc&search=&limit=5',

      Response response = await httpClient.get(
        '$url/api/device/fav$queryParams',
        headers: headers,
      );
      Logger.PretteyLogger(response.body);
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostPasswordResp.fromJson(response.body);
      } else {

        throw response.body != null
            ? PostPasswordResp.fromJson(response.body)
            : 'Something Went Wrong!';


      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }




  Future<HotelsResponse> GetHotels({
    Map<String, String> headers = const {},
    Map requestData = const {},


  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();

      String queryParams = '';

      if (requestData.isNotEmpty) {
        List<String> queryParamList = requestData.entries.map((entry) {
          final key = Uri.encodeQueryComponent(entry.key);
          final value = Uri.encodeQueryComponent(entry.value.toString());
          return '$key=$value';
        }).toList();

        queryParams = '?' + queryParamList.join('&');
      }
      // $queryParams
      // '$url/api/device/hotels?page=1&ar_name=&en_name=&phone_number=&SortField=id&SortType=desc&search=&limit=5',

      Response response = await httpClient.get(
        '$url/api/device/hotels$queryParams',
        headers: headers,
      );

      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return HotelsResponse.fromJson(response.body);
      } else {

        throw response.body != null
            ? HotelsResponse.fromJson(response.body)
            : 'Something Went Wrong!';


      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }



  Future<RequestsResponse> GetRequestsRoom  ({
    Map<String, String> headers = const {},
    Map requestData = const {},


  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();

      String queryParams = '';

      if (requestData.isNotEmpty) {
        List<String> queryParamList = requestData.entries.map((entry) {
          final key = Uri.encodeQueryComponent(entry.key);
          final value = Uri.encodeQueryComponent(entry.value.toString());
          return '$key=$value';
        }).toList();

        queryParams = '?' + queryParamList.join('&');
      }
      // $queryParams
      // '$url/api/device/hotels?page=1&ar_name=&en_name=&phone_number=&SortField=id&SortType=desc&search=&limit=5',

      Response response = await httpClient.get(
        '$url/api/device/books$queryParams',
        headers: headers,
      );


      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return RequestsResponse.fromJson(response.body);
      } else {
      
        throw response.body != null
            ? RequestsResponse.fromJson(response.body)
            : 'Something Went Wrong!';


      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }




  Future<HotelsResponse> GetSavedsHotels({
    Map<String, String> headers = const {},
    Map requestData = const {},


  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();

      String queryParams = '';

      if (requestData.isNotEmpty) {
        List<String> queryParamList = requestData.entries.map((entry) {
          final key = Uri.encodeQueryComponent(entry.key);
          final value = Uri.encodeQueryComponent(entry.value.toString());
          return '$key=$value';
        }).toList();

        queryParams = '?' + queryParamList.join('&');
      }
      // $queryParams
      // '$url/api/device/hotels?page=1&ar_name=&en_name=&phone_number=&SortField=id&SortType=desc&search=&limit=5',

      Response response = await httpClient.get(
        '$url/api/device/saved',
        headers: headers,
      );

      Logger.PretteyLogger(response.body);

      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return HotelsResponse.fromJson(response.body);
      } else {

        throw response.body != null
            ? HotelsResponse.fromJson(response.body)
            : 'Something Went Wrong!';


      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }


  Future<HotelResponse> GetHotelDetail({
    Map<String, String> headers = const {},
    Map requestData = const {},
    String id =  "",


  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();


      Response response = await httpClient.get(
        '$url/api/device/hotel/'+ id.toString() ,
        headers: headers,
      );

      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {

        return HotelResponse.fromJson(response.body);
      } else {

        // print('$url/api/device/hotels$queryParams');
        throw response.body != null
            ? HotelResponse.fromJson(response.body)
            : 'Something Went Wrong!';


      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      // Logger.log(
      //   error,
      //   stackTrace: stackTrace,
      // );
      rethrow;
    }
  }





  Future<FlightDetailResp> GetFlightDetail({
    Map<String, String> headers = const {},
    Map requestData = const {},
    String id =  "",


  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();


      Response response = await httpClient.get(
        '$url/api/device/flight/'+ id.toString() ,
        headers: headers,
      );

      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {

        return FlightDetailResp.fromJson(response.body);

      } else {


        throw response.body != null
            ? FlightDetailResp.fromJson(response.body)
            : 'Something Went Wrong!';


      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }







  Future<RoomsResponse> GetRooms({
    Map<String, String> headers = const {},
    Map requestData = const {},
    String id =  "",


  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();

      String queryParams = '';

      if (requestData.isNotEmpty) {
        List<String> queryParamList = requestData.entries.map((entry) {
          final key = Uri.encodeQueryComponent(entry.key);
          final value = Uri.encodeQueryComponent(entry.value.toString());
          return '$key=$value';
        }).toList();

        queryParams = '?' + queryParamList.join('&');
      }

      Response response = await httpClient.get(
        '$url/api/device/get/hotel/'+ id.toString()+'/rooms' ,
        headers: headers,
      );

      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return RoomsResponse.fromJson(response.body);
      } else {
        Logger.PretteyLogger(response.body);
        throw response.body != null
            ? RoomsResponse.fromJson(response.body)
            : 'Something Went Wrong!';


      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }










  Future<RoomResponse> GetRoom({
    Map<String, String> headers = const {},
    Map requestData = const {},
    String id =  "",


  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();

      String queryParams = '';

      if (requestData.isNotEmpty) {
        List<String> queryParamList = requestData.entries.map((entry) {
          final key = Uri.encodeQueryComponent(entry.key);
          final value = Uri.encodeQueryComponent(entry.value.toString());
          return '$key=$value';
        }).toList();

        queryParams = '?' + queryParamList.join('&');
      }

      Response response = await httpClient.get(
        '$url/api/device/room/'+ id.toString()  ,
        headers: headers,
      );

      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return RoomResponse.fromJson(response.body);
      } else {

        throw response.body != null
            ? RoomResponse.fromJson(response.body)
            : 'Something Went Wrong!';


      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }





  Future<CarResp> GetCar({
    Map<String, String> headers = const {},
    Map requestData = const {},
    String id =  "",


  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();

      String queryParams = '';

      if (requestData.isNotEmpty) {
        List<String> queryParamList = requestData.entries.map((entry) {
          final key = Uri.encodeQueryComponent(entry.key);
          final value = Uri.encodeQueryComponent(entry.value.toString());
          return '$key=$value';
        }).toList();

        queryParams = '?' + queryParamList.join('&');
      }

      Response response = await httpClient.get(
        '$url/api/device/car/'+ id.toString()  ,
        headers: headers,
      );

      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return CarResp.fromJson(response.body);
      } else {

        throw response.body != null
            ? CarResp.fromJson(response.body)
            : 'Something Went Wrong!';


      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }



  Future<AboutResp> GetAbout({
    Map<String, String> headers = const {},
    Map requestData = const {},
    String id =  "",


  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();

      String queryParams = '';

      if (requestData.isNotEmpty) {
        List<String> queryParamList = requestData.entries.map((entry) {
          final key = Uri.encodeQueryComponent(entry.key);
          final value = Uri.encodeQueryComponent(entry.value.toString());
          return '$key=$value';
        }).toList();

        queryParams = '?' + queryParamList.join('&');
      }

      Response response = await httpClient.get(
        '$url/api/device/about',
        headers: headers,
      );

      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return AboutResp.fromJson(response.body);
      } else {

        throw response.body != null
            ? AboutResp.fromJson(response.body)
            : 'Something Went Wrong!';


      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }


  Future<BookResponse> Book({
    Map<String, String> headers = const {},
    Map requestData = const {},

  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();

      Response response = await httpClient.post(
        '$url/api/device/pay',
        headers: headers,
        body: requestData,
      );

      ProgressDialogUtils.hideProgressDialog();
      Logger.PretteyLogger(response.body);
      if (_isSuccessCall(response)) {
        return BookResponse.fromJson(response.body);
      } else {
        Logger.PretteyLogger(response.body);
        throw response.body != null
            ? BookResponse.fromJson(response.body)
            : 'Something Went Wrong!';


      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }





  Future<FlightsResponse> GetFlights({
    Map<String, String> headers = const {},
    Map requestData = const {},


  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();

      String queryParams = '';

      if (requestData.isNotEmpty) {
        List<String> queryParamList = requestData.entries.map((entry) {
          final key = Uri.encodeQueryComponent(entry.key);
          final value = Uri.encodeQueryComponent(entry.value.toString());
          return '$key=$value';
        }).toList();

        queryParams = '?' + queryParamList.join('&');
      }
      // $queryParams
      // '$url/api/device/hotels?page=1&ar_name=&en_name=&phone_number=&SortField=id&SortType=desc&search=&limit=5',

      Response response = await httpClient.get(
        '$url/api/device/flights$queryParams',
        headers: headers,
      );

      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return FlightsResponse.fromJson(response.body);
      } else {

        throw response.body != null
            ? FlightsResponse.fromJson(response.body)
            : 'Something Went Wrong!';


      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }



  Future<MyBooks> GetMyBooks({
    Map<String, String> headers = const {},
    Map requestData = const {},


  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();

      String queryParams = '';

      if (requestData.isNotEmpty) {
        List<String> queryParamList = requestData.entries.map((entry) {
          final key = Uri.encodeQueryComponent(entry.key);
          final value = Uri.encodeQueryComponent(entry.value.toString());
          return '$key=$value';
        }).toList();

        queryParams = '?' + queryParamList.join('&');
      }
      // $queryParams
      // '$url/api/device/hotels?page=1&ar_name=&en_name=&phone_number=&SortField=id&SortType=desc&search=&limit=5',

      Response response = await httpClient.get(
        '$url/api/device/mybooks',
        headers: headers,
      );

      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return MyBooks.fromJson(response.body);
      } else {

        throw response.body != null
            ? MyBooks.fromJson(response.body)
            : 'Something Went Wrong!';


      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }



  Future<CarsResp> GetCars({
    Map<String, String> headers = const {},
    Map requestData = const {},


  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();

      String queryParams = '';

      if (requestData.isNotEmpty) {
        List<String> queryParamList = requestData.entries.map((entry) {
          final key = Uri.encodeQueryComponent(entry.key);
          final value = Uri.encodeQueryComponent(entry.value.toString());
          return '$key=$value';
        }).toList();

        queryParams = '?' + queryParamList.join('&');
      }
      // $queryParams
      // '$url/api/device/hotels?page=1&ar_name=&en_name=&phone_number=&SortField=id&SortType=desc&search=&limit=5',

      Response response = await httpClient.get(
        '$url/api/device/cars$queryParams',
        headers: headers,
      );

      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return CarsResp.fromJson(response.body);
      } else {

        throw response.body != null
            ? CarsResp.fromJson(response.body)
            : 'Something Went Wrong!';


      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }






}
