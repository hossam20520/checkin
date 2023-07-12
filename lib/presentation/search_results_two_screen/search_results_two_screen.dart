import 'package:flutter/services.dart';

import '../home_hotels_container_page/models/HotelsItemModel.dart';
import '../search_results_two_screen/widgets/searchresults_item_widget.dart';
import 'controller/search_results_two_controller.dart';
import 'models/searchresults_item_model.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:checkin/presentation/filter_bottomsheet/filter_bottomsheet.dart';
import 'package:checkin/presentation/filter_bottomsheet/controller/filter_controller.dart';
import 'package:checkin/presentation/sort_bottomsheet/sort_bottomsheet.dart';
import 'package:checkin/presentation/sort_bottomsheet/controller/sort_controller.dart';

class SearchResultsTwoScreen extends GetWidget<SearchResultsTwoController> {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    //
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(
    //
    //       statusBarColor: ColorConstant.indigo900,
    //     ));
    final parameter = Get.arguments['search'];
    controller.searchResultsTwoModelObj.value.search.value = parameter;
    return   Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(50),
                leadingWidth: 20,
                leading:IconButton(onPressed: ()=> Get.back()  , icon: Icon(Icons.chevron_left , size: 35,),) ,
                title: AppbarSubtitle1(
                    text: controller.searchResultsTwoModelObj.value.search.value, margin: getMargin(left: 30)),
                styleType: Style.bgFillIndigo900),
            body:Container(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         InkWell( onTap: ()=> onTapFilter(),  child: Padding(
                             padding: getPadding(left: 10, top: 5, right: 10),
                             child:Container(  width: 100 , height: 50,     child:

                             Row(  children: [
                               Padding(
                                   padding: getPadding(left: 10,  right: 10),
                                   child: CustomImageView(
                                       svgPath: ImageConstant.imgFilter,
                                       height: getSize(20),
                                       width: getSize(20))),
                               Text("Filter".tr,
                                   overflow: TextOverflow.ellipsis,
                                   textAlign: TextAlign.left,
                                   style: AppStyle.txtMontserratRegular14Bluegray800),

                             ],), )
                         ),) ,


                            InkWell(onTap: ()=> onTapSort() ,   child:  Padding(
                                padding: getPadding(left: 10, top: 5, right: 10),
                                child:Container(  width: 100 , height: 50, child:   Row(


                                  children: [
                                    Padding(
                                        padding: getPadding(left: 10,  right: 10),
                                        child:Icon(Icons.sort , color: ColorConstant.blueGray800 , ))
                                    ,
                                    Text("Sort".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtMontserratRegular14Bluegray800),

                                  ],),))),
                      ],),

                      Expanded(
                          child: Padding(
                              padding: getPadding(left: 8, top: 24, right: 8),
                              child: Obx(() => ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                        height: getVerticalSize(15));
                                  },
                                  itemCount: controller.searchResultsTwoModelObj
                                      .value.HotelsItems.value.length,
                                  itemBuilder: (context, index) {
                                    HotelsItemModel model = controller
                                        .searchResultsTwoModelObj
                                        .value
                                        .HotelsItems
                                        .value[index];
                                    return SearchresultsItemWidget(model,
                                        onTapRowwxh: () {
                                      onTapRowwxh(model);
                                    });
                                  }
                                  )
                              )
                          )
                      )
                    ])));
  }

  onTapRowwxh(model) {

    Get.toNamed(
      AppRoutes.hotelScreen,
      arguments: model.id.toString(),
    );
  }

  onTapFilter() {
    Get.bottomSheet(
      FilterBottomsheet(
        Get.put(
          FilterController(),
        ),
      ),
      isScrollControlled: true,
    );
  }

  onTapSort() {
    Get.bottomSheet(
      SortBottomsheet(
        Get.put(
          SortController(),
        ),
      ),
      isScrollControlled: true,
    );
  }

  onTapArrowleft7() {
    Get.back();
  }
}
