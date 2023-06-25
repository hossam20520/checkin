import 'package:checkin/presentation/payment_one_screen/controller/payment_one_controller.dart';
import 'package:checkin/presentation/payment_two_screen/controller/payment_two_controller.dart';

import '../home_hotels_container_page/controller/home_hotels_container_controller.dart';
import '../payment_screen/controller/payment_controller.dart';
import '../room_one_screen/controller/room_one_controller.dart';
import 'controller/payment_web_controller.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/appbar_subtitle.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebScreen extends GetWidget<PaymentWebController> {


  @override
  Widget build(BuildContext context) {
    final parameter = Get.arguments;
    // Logger.PretteyLogger(parameter);
    Rx<String> url = Rx("");

    if(parameter == "flight"){
       url =      Get.find<PaymentTwoController>().paymentTwoModelObj.value.url;


    }else if(parameter == "room"){
         url = Get.find<PaymentController>().paymentModelObj.value.url;



    }else if(parameter == "car"){
      url = Get.find<PaymentOneController>().paymentOneModelObj.value.url;
    }
    // print(controller.paymentModelObj.value.url.value.toString());
    WebViewController? _webViewController;

    return Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(40),
                leadingWidth: 60,
                leading: IconButton(
                  onPressed: ()=> Get.back(),
                  icon:  Icon(Icons.chevron_left, color:Colors.white ,size:35 , ),
                ),
                title: AppbarSubtitle(
                    text: "lbl_payment".tr, margin: getMargin(left: 30)),
                styleType: Style.bgFillIndigo900),
            body:WebView(
              initialUrl: url.toString() ,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
              onPageFinished: (url) {
                // Page finished loading
              },
              navigationDelegate: (NavigationRequest request) {


                if (request.url.startsWith('https://checkin.com/success')) {
                  Get.toNamed(
                    AppRoutes.successFourScreen,
                  );
                  // Handle the return URL here
                  // You can extract necessary data from the URL if needed

                  // Check for the desired response condition
                  // if (/* Check if the response meets the desired condition */) {
                  //   // Perform your logic when the desired response is received
                  //
                  //   // Close the WebView
                  //   // _webViewController?.clearCache();
                  //   // _webViewController?.clearHistory();
                  //   Navigator.pop(context); // Return to the previous screen or close the WebView screen
                  // }
                }
                return NavigationDecision.navigate;
              },
            ),
        );
  }

  onTapReservenow() {
    // controller.pay();
    // Get.toNamed(
    //   AppRoutes.successFourScreen,
    //
    // );
  }

  onTapArrowleft11() {
    Get.back();
  }
}
