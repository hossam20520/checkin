import '../../../widgets/custom_button.dart';
import '../controller/search_results_one_controller.dart';
import '../models/flightItemModel.dart';
import '../models/listgroup10342_item_model.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultFlightItemWedget extends StatelessWidget {
  ResultFlightItemWedget(this.listItemModel);

  FlightItemModel listItemModel;

  var controller = Get.find<SearchResultsOneController>();

  @override
  Widget build(BuildContext context) {
    return        Padding(
        padding: getPadding(left: 28, right: 27),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [


          CustomImageView(
                fit: BoxFit.cover,
                 url: listItemModel.Image.toString(),
                  height: getVerticalSize(152),
                  width: getHorizontalSize(338),
                  radius: BorderRadius.only(
                      topLeft: Radius.circular(
                          getHorizontalSize(10)),
                      topRight: Radius.circular(
                          getHorizontalSize(10))))  ,
              Container(
                  width: double.maxFinite,
                  child: Container(
                      padding: getPadding(
                          left: 10,
                          top: 9,
                          right: 10,
                          bottom: 9),
                      decoration:
                      AppDecoration.outlineIndigo502,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: [
                           Text( listItemModel.title.toString(),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle
                                    .txtMontserratMedium1827),
                            Padding(
                                padding: getPadding(
                                    top: 17, right: 7),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Card(
                                          clipBehavior: Clip.antiAlias,
                                          elevation: 0,
                                          margin: EdgeInsets.all(0),
                                          color: ColorConstant.indigo50,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadiusStyle.circleBorder15,
                                          ),
                                          child: Container(
                                            height: getSize(
                                              30,
                                            ),
                                            width: getSize(
                                              30,
                                            ),
                                            padding: getPadding(
                                              left: 3,
                                              top: 7,
                                              right: 3,
                                              bottom: 7,
                                            ),
                                            decoration: AppDecoration.fillIndigo50.copyWith(
                                              borderRadius: BorderRadiusStyle.circleBorder15,
                                            ),
                                            child: Stack(
                                              children: [
                                                CustomImageView(
                                                  imagePath: ImageConstant.imgWizzairlogo1,
                                                  height: getVerticalSize(
                                                    15,
                                                  ),
                                                  width: getHorizontalSize(
                                                    22,
                                                  ),
                                                  alignment: Alignment.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 7,
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                listItemModel.from.toString(),
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.txtMontserratRegular1279,
                                                ),
                                              Padding(
                                                padding: getPadding(
                                                  top: 2,
                                                ),
                                                child:  Text(
                                                      listItemModel.airFrom.toString() ,
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle.txtMontserratLight914,
                                                  ),

                                              ),



                                            ],
                                          ),
                                        ),
                                        Spacer(),





                                      ],
                                    ),
                                      SizedBox(height: 15,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Card(
                                          clipBehavior: Clip.antiAlias,
                                          elevation: 0,
                                          margin: EdgeInsets.all(0),
                                          color: ColorConstant.indigo50,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadiusStyle.circleBorder15,
                                          ),
                                          child: Container(
                                            height: getSize(
                                              30,
                                            ),
                                            width: getSize(
                                              30,
                                            ),
                                            padding: getPadding(
                                              left: 3,
                                              top: 7,
                                              right: 3,
                                              bottom: 7,
                                            ),
                                            decoration: AppDecoration.fillIndigo50.copyWith(
                                              borderRadius: BorderRadiusStyle.circleBorder15,
                                            ),
                                            child: Stack(
                                              children: [
                                                CustomImageView(
                                                  imagePath: ImageConstant.imgWizzairlogo1,
                                                  height: getVerticalSize(
                                                    15,
                                                  ),
                                                  width: getHorizontalSize(
                                                    22,
                                                  ),
                                                  alignment: Alignment.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 7,
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                           Text(
                                                listItemModel.to.toString() ,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtMontserratRegular1279,
                                              )  ,
                                              Padding(
                                                padding: getPadding(
                                                  top: 2,
                                                ),
                                                child: Text(
                                                  listItemModel.airto.toString(),
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.txtMontserratLight914,
                                                )  ,

                                              ),



                                            ],
                                          ),
                                        ),
                                        Spacer(),

                                      ],
                                    )
                                  ],
                                )
                            ),
                            Padding(
                                padding: getPadding(
                                    top: 23,
                                    right: 7,
                                    bottom: 5),
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                       CustomButton(
                                        onTap: ()=> Select( listItemModel.id.toString()  )    ,
                                          height:
                                          getVerticalSize(
                                              39),

                                          width:
                                          getHorizontalSize(
                                              114),
                                          text: "lbl_select".tr,
                                          padding: ButtonPadding
                                              .PaddingT10,
                                          fontStyle: ButtonFontStyle
                                              .MontserratRegular14,


                                          )   ,
                                  Padding(
                                          padding: getPadding(
                                              top: 9,
                                              bottom: 9),
                                          child: Text(
                                              listItemModel.price.toString()  + " OMR",
                                              overflow:
                                              TextOverflow
                                                  .ellipsis,
                                              textAlign:
                                              TextAlign
                                                  .left,
                                              style: AppStyle
                                                  .txtMontserratSemiBold16))
                                    ]))
                          ]))),

            ]));
  }

  void Select(id){
    Get.toNamed( AppRoutes.paymentTwoScreen,
    arguments: id,
    );
  }
  void onTapSelect() {}
}
