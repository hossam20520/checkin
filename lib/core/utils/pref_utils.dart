import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: must_be_immutable
class PrefUtils {
  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  static SharedPreferences? _sharedPreferences;




  Future<void> isLogged(String value) {
    return _sharedPreferences!.setString('logged', value);
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setName(String value) {
    return _sharedPreferences!.setString('name', value);
  }

  Future<void> setLastname(String value) {
    return _sharedPreferences!.setString('lastname', value);
  }

  Future<void> setUsername(String value) {
    return _sharedPreferences!.setString('username', value);
  }

  Future<void> setPhone(String value) {
    return _sharedPreferences!.setString('phone', value);
  }

  Future<void> setEmail(String value) {
    return _sharedPreferences!.setString('email', value);
  }

  Future<void> setAvatar(String value) {
    return _sharedPreferences!.setString('avatar', value);
  }

  Future<void> setID(String value) {
    return _sharedPreferences!.setString('id', value);
  }

  String getName() {
    try {
      return _sharedPreferences!.getString('name') ?? '';
    } catch (e) {
      return '';
    }
  }

  String getEmail() {
    try {
      return _sharedPreferences!.getString('email') ?? '';
    } catch (e) {
      return '';
    }
  }


  String getAvatar() {
    try {
      return _sharedPreferences!.getString('avatar') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setRole(int value) {
    return _sharedPreferences!.setInt('role', value);
  }

  int getRole() {
    try {
      return _sharedPreferences!.getInt('role') ?? 0;
    } catch (e) {
      return 0;
    }
  }

  Future<void> setId(String value) {
    return _sharedPreferences!.setString('id', value);
  }

  String getId() {
    try {
      return _sharedPreferences!.getString('id') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setToken(String value) {
    return _sharedPreferences!.setString('token', value);
  }

  Future<void> setIsProvider(String value) {
    return _sharedPreferences!.setString('isProvider', value);
  }

  Future<void> setFlight(String value) {
    return _sharedPreferences!.setString('flight', value);
  }

  Future<void> setHotel(String value) {
    return _sharedPreferences!.setString('hotel', value);
  }

  Future<void> setCar(String value) {
    return _sharedPreferences!.setString('car', value);
  }

  Future<void> setLang(String value) {
    return _sharedPreferences!.setString('language', value);
  }

  Future<void> setType(String value) {
    return _sharedPreferences!.setString('type', value);
  }


  String getType() {
    try {
      return _sharedPreferences!.getString('type') ?? '';
    } catch (e) {
      return 'en';
    }
  }
  String getLang() {
    try {
      return _sharedPreferences!.getString('language') ?? '';
    } catch (e) {
      return 'en';
    }
  }


  String getCar() {
    try {
      return _sharedPreferences!.getString('car') ?? '';
    } catch (e) {
      return '';
    }
  }


  String getHotel() {
    try {
      return _sharedPreferences!.getString('hotel') ?? '';
    } catch (e) {
      return '';
    }
  }

  String getToken() {
    try {
      return _sharedPreferences!.getString('token') ?? '';
    } catch (e) {
      return '';
    }
  }


  String getFlight() {
    try {
      return _sharedPreferences!.getString('flight') ?? '';
    } catch (e) {
      return '';
    }
  }



  String getIsProvider() {
    try {
      return _sharedPreferences!.getString('isProvider') ?? '';
    } catch (e) {
      return '';
    }
  }

  String getUsername() {
    try {
      return _sharedPreferences!.getString('username') ?? '';
    } catch (e) {
      return '';
    }
  }


  String getLastname() {
    try {
      return _sharedPreferences!.getString('lastname') ?? '';
    } catch (e) {
      return '';
    }
  }



  String getIslogged() {
    try {
      return _sharedPreferences!.getString('logged') ?? 'no';
    } catch (e) {
      return '';
    }
  }

  String getPhone() {
    try {
      return _sharedPreferences!.getString('phone') ?? '';
    } catch (e) {
      return '';
    }
  }





}
