import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/forgot_password_screen/models/forgot_password_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ForgotPasswordController extends GetxController {
  Rx<ForgotPasswordModel> forgotPasswordModelObj = ForgotPasswordModel().obs;


  TextEditingController mobilenumberController = TextEditingController();



  Future<void> verifyPhoneNumber()   async {
       String phone =  mobilenumberController.text;

       forgotPasswordModelObj.update((model) {
         model!.phone = Rx(phone);
       });

       FirebaseAuth auth = FirebaseAuth.instance;
         final phoneNumber =  phone;

         await auth.verifyPhoneNumber(
           phoneNumber: phoneNumber,
           verificationCompleted: (PhoneAuthCredential credential) {
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
