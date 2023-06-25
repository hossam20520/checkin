import 'package:checkin/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.autofocus = false,
      this.margin,
      this.controller,
      this.focusNode,
      this.isObscureText = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.maxLines,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.validator});

  TextFormFieldShape? shape;

  TextFormFieldPadding? padding;

  TextFormFieldVariant? variant;

  TextFormFieldFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  bool? isObscureText;

  TextInputAction? textInputAction;

  TextInputType? textInputType;

  int? maxLines;

  bool? autofocus;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  _buildTextFormFieldWidget() {
    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      child: TextFormField(

        controller: controller,
        focusNode: focusNode,
        style: _setFontStyle(),
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: _buildDecoration(),
        validator: validator,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(

      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {

      case TextFormFieldFontStyle.MontserratLight1094:
        return TextStyle(
          color: ColorConstant.indigo300,
          fontSize: getFontSize(
            10.94,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w300,
        );

      case TextFormFieldFontStyle.MontserratRegular20:
        return TextStyle(
          color: ColorConstant.indigo300,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.MontserratLight18:
        return TextStyle(
          color: ColorConstant.indigo300,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w300,
        );
      case TextFormFieldFontStyle.MontserratLight1094:
        return TextStyle(
          color: ColorConstant.indigo300,
          fontSize: getFontSize(
            10.94,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w300,
        );
      case TextFormFieldFontStyle.MontserratLight14:
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
          color: ColorConstant.indigo300,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w300,
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            11.00,
          ),
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {

      case TextFormFieldVariant.OutlineIndigo300_1:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.indigo300,
            width: 1,
          ),
        );
      case TextFormFieldVariant.None:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.indigo300,
            width: 1,
          ),
        );
    }
  }


  // _setFillColor() {
  //   switch (variant) {
  //     default:
  //       return ColorConstant.whiteA700;
  //   }
  // }

  // _setFilled() {
  //   switch (variant) {
  //     case TextFormFieldVariant.None:
  //       return false;
  //     default:
  //       return true;
  //   }
  // }

  _setFillColor() {
    switch (variant) {
      case TextFormFieldVariant.OutlineIndigo300_1:
        return ColorConstant.whiteA700;
      default:
        return null;
    }
  }

  _setFilled() {
    switch (variant) {
      case TextFormFieldVariant.OutlineIndigo300_1:
        return true;
      case TextFormFieldVariant.OutlineIndigo300:
        return false;
      case TextFormFieldVariant.None:
        return false;
      default:
        return false;
    }
  }

  _setPadding() {
    switch (padding) {
      case TextFormFieldPadding.PaddingAll15:
        return getPadding(
          all: 15,
        );
      case TextFormFieldPadding.PaddingT16:
        return getPadding(
          top: 16,
          bottom: 16,
        );
      case TextFormFieldPadding.PaddingT5:
        return getPadding(
          top: 5,
          right: 5,
          bottom: 5,
        );
      default:
        return getPadding(
          top: 15,
          right: 15,
          bottom: 15,
        );
    }
  }
}

enum TextFormFieldShape {
  RoundedBorder11,
}

enum TextFormFieldPadding {
  PaddingT15,
  PaddingAll15,
  PaddingT16,
  PaddingT5,
}

enum TextFormFieldVariant {
  None,
  OutlineIndigo300_1,
  OutlineIndigo300,
}

enum TextFormFieldFontStyle {
  MontserratLight16,
  MontserratRegular20,
  MontserratLight18,
  MontserratLight1094,
  MontserratLight14,
}
