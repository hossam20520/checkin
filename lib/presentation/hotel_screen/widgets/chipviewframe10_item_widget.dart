import '../models/chipviewframe10_item_model.dart';
import 'package:checkin/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Chipviewframe10ItemWidget extends StatelessWidget {
  Chipviewframe10ItemWidget(this.chipviewframe10ItemModelObj);

  Chipviewframe10ItemModel chipviewframe10ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Theme(
        data: ThemeData(
          canvasColor: Colors.transparent,
        ),
        child: RawChip(
          padding: getPadding(
            right: 12,
          ),
          showCheckmark: false,
          labelPadding: EdgeInsets.zero,
          label: Text(
            chipviewframe10ItemModelObj.frame10367Txt.value,
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
          avatar: CustomImageView(
            svgPath: ImageConstant.imgMaterialsymbolswifi,
            height: getSize(
              15,
            ),
            width: getSize(
              15,
            ),
            margin: getMargin(
              right: 8,
            ),
          ),
          selected: chipviewframe10ItemModelObj.isSelected.value,
          backgroundColor: Colors.transparent,
          selectedColor: ColorConstant.indigo30033,
          shape: chipviewframe10ItemModelObj.isSelected.value
              ? RoundedRectangleBorder(
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
              : RoundedRectangleBorder(
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
                ),
          onSelected: (value) {
            chipviewframe10ItemModelObj.isSelected.value = value;
          },
        ),
      ),
    );
  }
}
