import '../../home_hotels_container_page/models/HotelsItemModel.dart';
import '../controller/saved_controller.dart';
import '../models/saved_item_model.dart';
import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/custom_button.dart';

// ignore: must_be_immutable
class SavedItemWidget extends StatelessWidget {
  SavedItemWidget(
    this.savedItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  HotelsItemModel savedItemModelObj;

  var controller = Get.find<SavedController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        top: 7,
        bottom: 7,
      ),
      decoration: AppDecoration.outlineIndigo50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder11,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () => HotelPage(savedItemModelObj.id.toString()),
              child: Padding(
                  padding: getPadding(right: 8, left: 5),
                  child: Row(
                    children: [

                      CustomImageView(
                        fit: BoxFit.cover,
                        url: savedItemModelObj.image.toString(),
                        height: getVerticalSize(
                          102,
                        ),
                        width: getHorizontalSize(
                          140,
                        ),
                        radius: BorderRadius.circular(
                          getHorizontalSize(
                            10,
                          ),
                        ),
                        margin: getMargin(
                          top: 2,
                          bottom: 2,
                        ),
                      ),


                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Obx(() =>  Padding(
                            padding: getPadding(right: 8, left: 8 , bottom: 0),
                            child:  Text(
                              savedItemModelObj.title.toString(),
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtMontserratRegular14Black900,
                            )),),

                        Padding(
                          padding: getPadding(
                            top: 5,
                            bottom: 50,

                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                svgPath: ImageConstant.imgSignal,
                                height: getSize(
                                  8,
                                ),
                                width: getSize(
                                  8,
                                ),
                                margin: getMargin(
                                  top: 1,
                                  bottom: 4,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 4,
                                ),
                                child: Obx(
                                      () => Text(
                                    savedItemModelObj.country.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtMontserratLight12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],),





                    ],
                  ))),
          Padding(
            padding: getPadding(
              top: 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // IconButton(onPressed: ()=> print("aaa") , icon: Icon(Icons.delete_forever , color: Colors.red,)),

                    // Icon(Icons.delete, size: 35, color: ColorConstant.red900,)
                  ],
                ),

              ],
            ),
          ),

          Padding(
            padding: getPadding(
              top: 80,


            ),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // SizedBox(width: 90,),

                Container(
                  height: getVerticalSize(
                    29,
                  ),
                  width: getHorizontalSize(
                    73,
                  ),

                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          savedItemModelObj.price.toString()  ,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtMontserratSemiBold14,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "lbl_per_night".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtMontserratLight11,
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

  HotelPage(id) {
    Get.toNamed(
      AppRoutes.hotelScreen,
      arguments: id.toString(),
    );
  }
}
