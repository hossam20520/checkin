import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Constants{
  // static String BaseUrl = "http://10.0.2.2:8000";
  static String BaseUrl = "https://cheeckin.com";
  // static String BaseUrl = "http://192.168.1.7:8000";


  static String imageHotels = BaseUrl+"/images/hotels/";
  static String flights = BaseUrl+"/images/flights/";
  static String cars = BaseUrl+"/images/cars/";
  static String imageRooms = BaseUrl+"/images/rooms/";
  static String imageAvatar = BaseUrl+"/images/avatar/";

  static String language(){
    final currentLocale = getCurrentLocale();

    // Access the locale information
    final languageCode = currentLocale.languageCode;
    final countryCode = currentLocale.countryCode;
    return languageCode;
  }
  static Locale getCurrentLocale() {
    if (WidgetsBinding.instance!.window.locale != null) {

      return WidgetsBinding.instance!.window.locale;
    } else {

      return const Locale('en', 'US'); // Default locale if not found
    }
  }

}
