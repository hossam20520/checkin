import 'package:checkin/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,

      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  double? width;

  double? height;

  String? text;

  Widget? prefixWidget;

  Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        width ?? double.maxFinite,
        height ?? getVerticalSize(40),
      ),
      padding: _setPadding(),
      backgroundColor: _setColor(),
      side: _setTextButtonBorder(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingT401:
        return getPadding(
          left: 30,
          top: 401,
          right: 107,
          bottom: 401,
        );
      case ButtonPadding.PaddingAll6:
        return getPadding(
          all: 6,
        );
      case ButtonPadding.PaddingT2:
        return getPadding(
          top: 2,
          right: 2,
          bottom: 2,
        );
      case ButtonPadding.PaddingT16:
        return getPadding(
          top: 16,
          right: 16,
          bottom: 16,
        );
      case ButtonPadding.PaddingAll14:
        return getPadding(
          all: 14,
        );
      case ButtonPadding.PaddingT1:
        return getPadding(
          top: 1,
          bottom: 1,
        );
      case ButtonPadding.PaddingT10:
        return getPadding(
          left: 10,
          top: 10,
          bottom: 10,
        );
      case ButtonPadding.PaddingT14:
        return getPadding(
          left: 14,
          top: 14,
          bottom: 14,
        );
      case ButtonPadding.PaddingT5:
        return getPadding(
          top: 5,
          right: 5,
          bottom: 5,
        );
      default:
        return getPadding(
          all: 18,
        );
    }
  }




  _setColor() {
    switch (variant) {
      case ButtonVariant.FillWhite300_1:
        return ColorConstant.whiteA700;
      case ButtonVariant.Primary:
        return ColorConstant.indigo900;
      case ButtonVariant.FillIndigo50:
        return ColorConstant.indigo50;
      case ButtonVariant.FillAmber700:
        return ColorConstant.amber700;
      case ButtonVariant.FillIndigo700:
        return ColorConstant.indigo700;
      case ButtonVariant.OutlineIndigo300_1:
        return ColorConstant.whiteA700;
      case ButtonVariant.OutlineIndigo300:
        return null;
      default:
        return ColorConstant.indigo900;
    }
  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariant.OutlineIndigo300:
        return BorderSide(
          color: ColorConstant.indigo300,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineIndigo300_1:
        return BorderSide(
          color: ColorConstant.indigo300,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.FillIndigo900:
      case ButtonVariant.FillIndigo50:
      case ButtonVariant.FillAmber700:
      case ButtonVariant.FillIndigo700:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.RoundedBorder5:
        return BorderRadius.circular(
          getHorizontalSize(
            5.00,
          ),
        );
      case ButtonShape.CircleBorder16:
        return BorderRadius.circular(
          getHorizontalSize(
            16.00,
          ),
        );
      case ButtonShape.CircleBorder16:
        return BorderRadius.circular(
          getHorizontalSize(
            16.00,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            11.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.MontserratSemiBold40:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            40,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.MontserratMedium16:
        return TextStyle(
          color: ColorConstant.indigo300,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.MontserratRegular18:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.MontserratSemiBold20Indigo300:
        return TextStyle(
          color: ColorConstant.indigo300,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.MontserratRegular18Black900:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.MontserratLight1519:
        return TextStyle(
          color: ColorConstant.indigo300,
          fontSize: getFontSize(
            15.19,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w300,
        );
      case ButtonFontStyle.MontserratRegular1291:
        return TextStyle(
          color: ColorConstant.indigo50,
          fontSize: getFontSize(
            12.91,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.MontserratRegular1533:
        return TextStyle(
          color: ColorConstant.indigo50,
          fontSize: getFontSize(
            15.33,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.MontserratRegular14:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.MontserratLight16:
        return TextStyle(
          color: ColorConstant.indigo300,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w300,
        );
      case ButtonFontStyle.MontserratLight14:
        return TextStyle(
          color: ColorConstant.indigo300,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w300,
        );
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        );
    }
  }
}

enum ButtonShape {
  CircleBorder16,
  Square,
  RoundedBorder11,
  RoundedBorder5,
}

enum ButtonPadding {
  PaddingAll6,
  CircleBorder16,
  PaddingT2,
  PaddingAll18,
  PaddingT401,
  PaddingT16,
  PaddingAll14,
  PaddingT1,
  PaddingT10,
  PaddingT14,
  PaddingT5,
}

enum ButtonVariant {
  Primary,
  FillIndigo900,
  OutlineIndigo300,
  FillIndigo50,
  FillAmber700,
  FillIndigo700,
  OutlineIndigo300_1,
  FillWhite300_1,
}

enum ButtonFontStyle {
  MontserratMedium16,
  MontserratSemiBold20,
  MontserratSemiBold40,
  MontserratRegular18,
  MontserratSemiBold20Indigo300,
  MontserratRegular18Black900,
  MontserratLight1519,
  MontserratRegular1291,
  MontserratRegular1533,
  MontserratRegular14,
  MontserratLight16,
  MontserratLight14,
}
