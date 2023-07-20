import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/forgot_password_screen/models/forgot_password_model.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ForgotPasswordController extends GetxController {
  Rx<ForgotPasswordModel> forgotPasswordModelObj = ForgotPasswordModel().obs;


  TextEditingController mobilenumberController = TextEditingController();
  SelectionPopupModel? selectedDropDownValue;


  void  onCountryChange(CountryCode countryCode) {
    //TODO : manipulate the selected country code here
    print("New Country selected: " + countryCode.toString());

    forgotPasswordModelObj.update((model) {
      model!.countryCode.value = countryCode.toString();
    });
    // Logger.PretteyLogger(countryCode.toString());
  }

  onSelected(dynamic value) {



    selectedDropDownValue = value as SelectionPopupModel;

    // createAccountModelObj.update((model) {
    //   model!.selectedId.value = value.id.toString();
    // });

    forgotPasswordModelObj.value.dropdownItemList.value.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });



    forgotPasswordModelObj.value.dropdownItemList.refresh();
  }

  Future<void> verifyPhoneNumber()   async {
       String phone =  mobilenumberController.text;

       forgotPasswordModelObj.update((model) {
         model!.phone = Rx(phone);
       });

       FirebaseAuth auth = FirebaseAuth.instance;
         final phoneNumber =  forgotPasswordModelObj.value.countryCode.toString()+phone;
       Logger.PretteyLogger(phoneNumber);
         await auth.verifyPhoneNumber(
           phoneNumber: phoneNumber,
           verificationCompleted: (PhoneAuthCredential credential) {
             forgotPasswordModelObj.value.smsCode.value  = credential.smsCode.toString();
             print('Verification completed with auto-retrieval: ${credential.smsCode}');
           },
           verificationFailed: (FirebaseAuthException e,  ) {
             print('Verification failed: $e');
             Logger.PretteyLogger("faildd");
           },
           codeSent: (String verificationId, int? resendToken) {
             Logger.PretteyLogger(verificationId);


             updateIDVerv(verificationId);

             // print('Verification code sent to $phoneNumber');
           },
           codeAutoRetrievalTimeout: (String verificationId) {
             print('Verification code retrieval timed out');
           },
         );





  }

updateIDVerv(verificationId){
  forgotPasswordModelObj.update((model) {
    model!.verificationId = Rx(verificationId);
  });
}



  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
