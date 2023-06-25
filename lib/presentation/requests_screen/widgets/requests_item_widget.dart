import '../controller/requests_controller.dart';
import '../models/requests_item_model.dart';
import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/custom_button.dart';

// ignore: must_be_immutable
class RequestsItemWidget extends StatelessWidget {
  RequestsItemWidget(
    this.requestsItemModelObj,  this.index, {
    Key? key,
  }) : super(
          key: key,
        );

  RequestsItemModel requestsItemModelObj;
 int index;
  var controller = Get.find<RequestsController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Container(
        padding: getPadding(
          left: 16,
          top: 15,
          right: 16,
          bottom: 15,
        ),
        decoration: AppDecoration.outlineIndigo3001.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder11,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                   "#"+ requestsItemModelObj.bookId.toString(),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtMontserratSemiBold1493,
                ),
                Text(
                    "25-10-2023",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtMontserratLight14,
                ),
              ],
            ),
            Padding(
              padding: getPadding(
                top: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: getPadding(
                      top: 2,
                    ),
                    child: Text(
                      "Status".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtMontserratLight12Bluegray30001,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 8,
                    ),
                    child: Text(
                      requestsItemModelObj.paymentModelRq!.value.status.toString(),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtMontserratSemiBold14Black900,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: getPadding(
                      top: 1,
                      bottom: 1,
                    ),
                    child: Text(
                      "price".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtMontserratLight12Bluegray30001,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 9,
                    ),
                    child: Text(

                      requestsItemModelObj.paymentModelRq!.value.totalPrice.toString()+ " OMR",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtMontserratSemiBold14Indigo700,
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              onTap: ()=> showDetail(requestsItemModelObj , index) ,
              height: getVerticalSize(
                50,
              ),
              text: "ShowDetail".tr,
              margin: getMargin(
                top: 10,
                bottom: 4,
              ),
              variant: ButtonVariant.FillIndigo900,
              padding: ButtonPadding.PaddingAll14,
              fontStyle:
              ButtonFontStyle.MontserratSemiBold20,
            ),
          ],
        ),
      ),
    );
  }


  void showDetail(model , index){
    // controller.requestsModelObj.value.reqeustRoom.value.idBook = Rx(model.id.toString());
    // controller.requestsModelObj.value.reqeustRoom.value.price = Rx(model.price.toString());



    // controller.requestsModelObj.value.reqeustRoom.value.idBook?.value = model.id.toString();
    // controller.requestsModelObj.value.reqeustRoom.value.idBook?.value = model.id.toString();
       Get.toNamed(AppRoutes.requestDetailsOneScreen,
       arguments: {"type": model.type.toString(), "index":index}
       );
  }
}
