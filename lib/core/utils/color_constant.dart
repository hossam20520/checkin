import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {

  static Color blueGray30001 = fromHex('#9b9cba');
  static Color blueGray800 = fromHex('#2f4858');
  static Color gray50 = fromHex('#f9f9f9');

  static Color red900 = fromHex('#b71c1d');

  static Color blueGray400 = fromHex('#888888');

  static Color indigo50 = fromHex('#e6e7f4');

  static Color amber700 = fromHex('#f29f05');

  static Color gray900 = fromHex('#141f26');

  static Color indigo700Cc = fromHex('#cc353ba3');

  static Color black9000c = fromHex('#0c000000');

  static Color indigo300 = fromHex('#8185c6');

  static Color indigo30075 = fromHex('#758185c6');

  static Color black90001 = fromHex('#090a0a');

  static Color lightBlueA20019 = fromHex('#1940bfff');

  static Color black900Cc = fromHex('#cc01021c');

  static Color black900 = fromHex('#01021c');

  static Color indigo30090 = fromHex('#908185c6');

  static Color indigo900 = fromHex('#030a8c');

  static Color black90019 = fromHex('#19000000');

  static Color indigo700 = fromHex('#353ba3');

  static Color indigo30033 = fromHex('#338185c6');

  static Color black90003 = fromHex('#000000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color black90002 = fromHex('#000000');

  static Color deepPurpleA400 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
