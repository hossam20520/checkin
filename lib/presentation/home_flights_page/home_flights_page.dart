import '../home_flights_page/widgets/cards_item_widget.dart';
import 'controller/home_flights_controller.dart';
import 'models/cards_item_model.dart';
import 'models/home_flights_model.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:checkin/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

class HomeFlightsPage extends StatelessWidget {



  HomeFlightsController controller =
      Get.put(HomeFlightsController(HomeFlightsModel().obs));

  @override
  Widget build(BuildContext context) {
    controller.fetchFlightssItems();
    return SafeArea( child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Padding(
                  padding: getPadding(
                    top: 16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Container(
                        width: double.maxFinite,
                        child: Container(
                          padding: getPadding(
                            left: 11,
                            top: 15,
                            right: 11,
                            bottom: 15,
                          ),
                          decoration: AppDecoration.fillIndigo700,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [



                              CustomSearchView(
                                focusNode: FocusNode(),
                                controller: controller.searchController,
                                hintText: "lbl_from".tr,
                                prefix: Container(
                                  margin: getMargin(
                                    left: 30,
                                    top: 17,
                                    right: 8,
                                    bottom: 17,
                                  ),
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgSearch,
                                  ),
                                ),
                                prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(
                                    50,
                                  ),
                                ),
                                suffix: Padding(
                                  padding: EdgeInsets.only(
                                    right: getHorizontalSize(
                                      15,
                                    ),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      controller.searchController.clear();
                                    },
                                    icon: Icon(
                                      Icons.clear,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                              ),



                              CustomSearchView(
                                focusNode: FocusNode(),
                                controller: controller.searchoneController,
                                hintText: "lbl_to".tr,
                                margin: getMargin(
                                  top: 10,
                                ),
                                prefix: Container(
                                  margin: getMargin(
                                    left: 30,
                                    top: 17,
                                    right: 8,
                                    bottom: 17,
                                  ),
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgSearch,
                                  ),
                                ),
                                prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(
                                    50,
                                  ),
                                ),
                                suffix: Padding(
                                  padding: EdgeInsets.only(
                                    right: getHorizontalSize(
                                      15,
                                    ),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      controller.searchoneController.clear();
                                    },
                                    icon: Icon(
                                      Icons.clear,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                              ),



                              Padding(
                                padding: getPadding(
                                  top: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   Obx(()=> InkWell(
                                     onTap:()=> openDatePickerDialogCheckin(),
                                     child:   Container(
                                        width: MediaQuery.of(context).size.width * 0.45,
                                        margin: getMargin(
                                          right: 5,
                                        ),
                                        padding: getPadding(
                                          left: 30,
                                          top: 13,
                                          right: 30,
                                          bottom: 13,
                                        ),
                                        decoration: AppDecoration
                                            .outlineIndigo3001
                                            .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder11,
                                        ),
                                        child: Row(
                                          children: [
                                            CustomImageView(
                                              svgPath: ImageConstant.imgGrid,
                                              height: getSize(
                                                15,
                                              ),
                                              width: getSize(
                                                15,
                                              ),
                                              margin: getMargin(
                                                top: 3,
                                                bottom: 3,
                                              ),
                                            ),
                                            Padding(
                                              padding: getPadding(
                                                left: 8,
                                                top: 2,
                                                right: 5
                                              ),
                                              child: Text(
                                                controller.homeFlightsModelObj.value.chekin.value.toString() ,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtMontserratLight16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),),



                                   SizedBox(width: 5,),
                                    Obx(()=> InkWell(
                                      onTap:()=> openDatePickerDialogCheckout(),
                                      child:   Container(
                                        width: MediaQuery.of(context).size.width * 0.45,
                                        margin: getMargin(
                                          left: 5,
                                        ),
                                        padding: getPadding(
                                          left: 30,
                                          top: 14,
                                          right: 30,
                                          bottom: 14,
                                        ),
                                        decoration: AppDecoration
                                            .outlineIndigo3001
                                            .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder11,
                                        ),
                                        child: Row(
                                          children: [
                                            CustomImageView(
                                              svgPath: ImageConstant.imgGrid,
                                              height: getSize(
                                                15,
                                              ),
                                              width: getSize(
                                                15,
                                              ),
                                              margin: getMargin(
                                                top: 2,
                                                bottom: 2,
                                              ),
                                            ),
                                            Padding(
                                              padding: getPadding(
                                                left: 8,
                                                right: 8
                                              ),
                                              child: Text(
                                                controller.homeFlightsModelObj.value.checkout.value.toString()    ,
                                                overflow: TextOverflow.ellipsis,

                                                style: AppStyle
                                                    .txtMontserratLight16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                     )),
                                  ],
                                ),


                              ),
                              CustomButton(
                                onTap: ()=> controller.search(),
                                height: getVerticalSize(
                                  50,
                                ),
                                text: "lbl_search".tr,
                                margin: getMargin(
                                  top: 10,
                                  bottom: 4,
                                ),
                                variant: ButtonVariant.FillAmber700,
                                padding: ButtonPadding.PaddingAll14,
                                fontStyle:
                                    ButtonFontStyle.MontserratRegular18Black900,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 11,
                          top: 27,
                          right: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "msg_flight_deals_from".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtMontserratMedium20,
                            ),
                            Padding(
                              padding: getPadding(
                                top: 1,
                                bottom: 3,
                              ),

                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child:  Container(
                          height: getVerticalSize(
                            373,
                          ),
                          child: Obx(
                            () => ListView.separated(
                              padding: getPadding(
                                left: 11,
                                top: 17,
                              ),
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: getVerticalSize(
                                    16,
                                  ),
                                );
                              },
                              itemCount: controller.homeFlightsModelObj.value
                                  .cardsItemList.value.length,
                              itemBuilder: (context, index) {
                                CardsItemModel model = controller
                                    .homeFlightsModelObj
                                    .value
                                    .cardsItemList
                                    .value[index];
                                return CardsItemWidget(
                                  model,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }






  Future<void> openDatePickerDialogCheckin() async {
    DateTime? dateTime = await showDatePicker(
        context: Get.context!,
        initialDate: controller.selectedopenDatePickerDialogCheckinDate,
        firstDate:  DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day) ,
        lastDate:DateTime(2050)

    );
    if (dateTime != null) {
      controller.homeFlightsModelObj.value.chekin.value = dateTime.toIso8601String().split('T').first;
      controller.selectedopenDatePickerDialogCheckinDate = dateTime;
    }
  }




  Future<void> openDatePickerDialogCheckout() async {
    DateTime? dateTime = await showDatePicker(
        context: Get.context!,
        initialDate: controller.selectedopenDatePickerDialogCheckinDate,
        firstDate:  DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day) ,
        lastDate:DateTime(2050)

    );
    if (dateTime != null) {
      controller.homeFlightsModelObj.value.checkout.value = dateTime.toIso8601String().split('T').first;
      controller.selectedopenDatePickerDialogCheckinDate = dateTime;
    }
  }




}
