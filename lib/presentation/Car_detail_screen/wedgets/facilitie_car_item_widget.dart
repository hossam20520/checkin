import '../models/FacilitesITesmModel.dart';

import 'package:checkin/core/app_export.dart';
import 'package:flutter/material.dart';


import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class FaceliteCarItemWidget extends StatelessWidget {
  FaceliteCarItemWidget(this.facItemModelObj);

  FacilitesItems facItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Theme(
        data: ThemeData(

          canvasColor: Colors.transparent,
        ),
        child: RawChip(
          padding: getPadding(
            right: 30,
            left: 23
          ),
          showCheckmark: false,
          labelPadding: EdgeInsets.zero,
          label: Text(
            facItemModelObj.title.toString(),
            textAlign: TextAlign.left,
            style: TextStyle(
              color: ColorConstant.indigo300,
              fontSize: getFontSize(
                14,
              ),
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w300,
            ),
          ),
          avatar:   Obx(
                  () => CustomImageView(
            url: facItemModelObj.icon.toString(),
            height: getSize(
              15,
            ),
            width: getSize(
              15,
            ),
            margin: getMargin(
              right: 8,
            ),
          ) ),

          backgroundColor: Colors.transparent,
          selectedColor: ColorConstant.indigo30033,
          shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: ColorConstant.indigo300,
                    width: getHorizontalSize(
                      1,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      11,
                    ),
                  ),
                )

        ),
      ),
    );
  }
}
