import 'package:flutter_html/flutter_html.dart';

import '../controller/bookings_controller.dart';
import '../models/bookings_item_model.dart';
import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';

// ignore: must_be_immutable
class BookingsItemWidget extends StatelessWidget {
  BookingsItemWidget(
    this.bookingsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  BookingsItemModel bookingsItemModelObj;

  var controller = Get.find<BookingsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        top: 11,
        bottom: 11,
      ),
      decoration: AppDecoration.outlineIndigo50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder11,
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
      Padding(
      padding: getPadding(
      right:10,
        left: 10
      ),
      child: Row(
        children: [
          CustomImageView(
            fit: BoxFit.cover,
            url: bookingsItemModelObj.image.toString(),
            height: getVerticalSize(
              102,
            ),
            width: getHorizontalSize(
              140,
            ),
            radius: BorderRadius.circular(
              getHorizontalSize(
                11,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Obx(() => Padding(
                padding: getPadding(right: 8 ,  left: 10 , bottom: 50),
                child:  Text(
                  bookingsItemModelObj.title.toString(),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtMontserratSemiBold14,
                )), ),

            Obx(
                  () => Padding(
                  padding: getPadding(

                  ),
                  child: Text(
                    bookingsItemModelObj.type.toString(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtMontserratLight12,
                  )),
            ),
          ],)



        ],
      ) ),

          Padding(
            padding: getPadding(
              top: 16,
              bottom: 11,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Padding(
                  padding: getPadding(
                    top: 25,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Padding(
                        padding: getPadding(left: 3, top:35, right: 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              bookingsItemModelObj.price.toString() + "ORM".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtMontserratSemiBold14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
