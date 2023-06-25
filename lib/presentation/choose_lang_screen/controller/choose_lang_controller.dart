import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/choose_lang_screen/models/choose_lang_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class ChooseLangController extends GetxController {
  TextEditingController languageController = TextEditingController();

  Rx<ChooseLangModel> chooseLangModelObj = ChooseLangModel().obs;



  void selectArabicLang(){
    chooseLangModelObj.value.isEnglish.value = false;
    Get.updateLocale(Locale('ar'));
    Get.find<PrefUtils>().setLang('ar');

      chooseLangModelObj.update((model) {
        model!.isEnglish = Rx(false);
      });
  }



  void selectEnglishLang(){
    chooseLangModelObj.value.isEnglish.value = false;
    Get.updateLocale(Locale('en'));
    Get.find<PrefUtils>().setLang('en');

    chooseLangModelObj.update((model) {
      model!.isEnglish = Rx(true);
    });
  }



  // void setLocale(String languageCode) {
  //   Get.updateLocale(Locale(languageCode));
  //   Get.find<PrefUtils>().setLang(languageCode);
  // }

  // void selectArabic() {
  //   setLocale('ar');
  //   chooseLangModelObj.update((model) {
  //     model!.isEnglishSelected = false;
  //   });
  // }

  // void selectEnglish() {
  //   setLocale('en');
  //   chooseLangModelObj.update((model) {
  //     model!.isEnglishSelected = true;
  //   });
  // }

  // void switchLanguage() {
  //   // Toggle the language selection
  //   chooseLangModelObj.update((model) {
  //     model!.isEnglishSelected = !model.isEnglishSelected;
  //   });
  //
  //   // Update the UI language or perform any necessary operations
  //   if (chooseLangModelObj.value.isEnglishSelected) {
  //     // Set English language
  //     // Code to update the app's language
  //   } else {
  //     // Set Arabic language
  //     // Code to update the app's language
  //   }
  // }

  @override
  void onReady() {
    super.onReady();


    String lang = Get.find<PrefUtils>().getLang();
    if(lang == "en"){
      chooseLangModelObj.value.isEnglish.value = true;
      Get.updateLocale(Locale('en'));
      chooseLangModelObj.update((model) {
        model!.isEnglish = Rx(true);
      });

    }else if(lang == "ar"){
      Get.updateLocale(Locale('ar'));
      chooseLangModelObj.value.isEnglish.value = false;
      chooseLangModelObj.update((model) {
        model!.isEnglish = Rx(false);
      });
    }

  }

  @override
  void onClose() {
    super.onClose();
    languageController.dispose();
  }
}
