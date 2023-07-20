import '../home_hotels_container_page/models/HotelsItemModel.dart';
import '../saved_page/widgets/saved_item_widget.dart';
import '../skip/skip.dart';
import 'controller/saved_controller.dart';
import 'models/saved_item_model.dart';
import 'models/saved_model.dart';
import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/appbar_title.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';

class SavedPage extends StatelessWidget {
  SavedPage({Key? key})
      : super(
          key: key,
        );

  SavedController controller = Get.put(SavedController(SavedModel().obs));

  @override
  Widget build(BuildContext context) {
    String isLogged = Get.find<PrefUtils>().getIslogged();
    // controller.fetchHotelsItems();
    return      Scaffold(
        backgroundColor: ColorConstant.whiteA700,

        body:

        isLogged == "yes" ?

        Padding(
          padding: getPadding(
            left: 8,
            top: 14,
            right: 8,
          ),
          child:FutureBuilder<void>(
              future: controller.fetchHotelsItems(),
              builder: (context, snapshot) {
                if (snapshot.connectionState ==
                    ConnectionState.done) {
                  // Widget tree when data fetching is complete
                  return Obx(
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
                      itemCount:
                      controller.savedModelObj.value.savedItemList.value.length,
                      itemBuilder: (context, index) {
                        HotelsItemModel model =
                        controller.savedModelObj.value.savedItemList.value[index];
                        return SavedItemWidget(
                          model,
                        );
                      },
                    ),
                  ) ;
                } else {
                  // Widget tree while data is being fetched
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })



        ) :

        SkipWidget()
      ,


    );
  }
}
