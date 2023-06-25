import '../bookings_page/widgets/bookings_item_widget.dart';
import '../skip/skip.dart';
import 'controller/bookings_controller.dart';
import 'models/bookings_item_model.dart';
import 'models/bookings_model.dart';
import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/appbar_title.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';

class BookingsPage extends StatelessWidget {
  BookingsPage({Key? key})
      : super(
          key: key,
        );

  BookingsController controller =
      Get.put(BookingsController(BookingsModel().obs));

  @override
  Widget build(BuildContext context) {
    String isLogged = Get.find<PrefUtils>().getIslogged();

    controller.fetchCarsItems();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,

        body:

        isLogged == "yes" ?
        Padding(
          padding: getPadding(
            left: 8,
            top: 12,
            right: 8,
          ),
          child: SingleChildScrollView(
            child: Column(children: [
           InkWell(onTap:  controller.fetchCarsItems, child:  Container(

            ),),



            Obx(
                  () => ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (
                    context,
                    index,
                    ) {
                  return SizedBox(
                    height: getVerticalSize(
                      16,
                    ),
                  );
                },
                itemCount: controller
                    .bookingsModelObj.value.bookingsItemList.value.length,
                itemBuilder: (context, index) {
                  BookingsItemModel model = controller
                      .bookingsModelObj.value.bookingsItemList.value[index];

                  return BookingsItemWidget(
                    model,
                  );
                },
              ),
            ),

          ],
            ) ),


        ) :

        SkipWidget()
        ,
      ),
    );
  }
}
