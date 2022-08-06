import 'package:flutter/material.dart';
import 'package:posterr/core/theme/custom_colors.dart';

class CustomTextStyles {
  const CustomTextStyles._();

  static const instance = CustomTextStyles._();

  static final Color _color = CustomColors.instance.black;
  static const FontWeight _lightWeight = FontWeight.w200;
  static const FontWeight _regularWeight = FontWeight.w400;
  static const FontWeight _boldWeight = FontWeight.w700;
  static const double _bodyMicroFontSize = 10;
  static const double _bodyTinyFontSize = 12;
  static const double _bodySmallFontSize = 14;
  static const double _bodyRegularFontSize = 16;
  static const double _subtitleFontSize = 18;
  static const double _headerFontSize = 20;
  static const double _titleFontSize = 24;
  static const double _bigTitleFontSize = 32;
  static const double _logoFontSize = 40;

  TextStyle logo({Color? color}) => TextStyle(
        color: color ?? _color,
        fontSize: _logoFontSize,
        fontFamily: 'Playlist Script',
      );

  TextStyle bodyMicroLight({Color? color}) => TextStyle(
        fontSize: _bodyMicroFontSize,
        fontWeight: _lightWeight,
        color: color ?? _color,
      );

  TextStyle bodyMicroRegular({Color? color}) => TextStyle(
        fontSize: _bodyMicroFontSize,
        fontWeight: _regularWeight,
        color: color ?? _color,
      );

  TextStyle bodyMicroBold({Color? color}) => TextStyle(
        fontSize: _bodyMicroFontSize,
        fontWeight: _boldWeight,
        color: color ?? _color,
      );

  TextStyle bodyTinyLight({Color? color}) => TextStyle(
        fontSize: _bodyTinyFontSize,
        fontWeight: _lightWeight,
        color: color ?? _color,
      );

  TextStyle bodyTinyRegular({Color? color}) => TextStyle(
        fontSize: _bodyTinyFontSize,
        fontWeight: _regularWeight,
        color: color ?? _color,
      );

  TextStyle bodyTinyBold({Color? color}) => TextStyle(
        fontSize: _bodyTinyFontSize,
        fontWeight: _boldWeight,
        color: color ?? _color,
      );

  TextStyle bodySmallLight({Color? color}) => TextStyle(
        fontSize: _bodySmallFontSize,
        fontWeight: _lightWeight,
        color: color ?? _color,
      );

  TextStyle bodySmallRegular({Color? color}) => TextStyle(
        fontSize: _bodySmallFontSize,
        fontWeight: _regularWeight,
        color: color ?? _color,
      );

  TextStyle bodySmallBold({Color? color}) => TextStyle(
        fontSize: _bodySmallFontSize,
        fontWeight: _boldWeight,
        color: color ?? _color,
      );

  TextStyle bodyLight({Color? color}) => TextStyle(
        fontSize: _bodyRegularFontSize,
        fontWeight: _lightWeight,
        color: color ?? _color,
      );

  TextStyle bodyRegular({Color? color}) => TextStyle(
        fontSize: _bodyRegularFontSize,
        fontWeight: _regularWeight,
        color: color ?? _color,
      );

  TextStyle bodyBold({Color? color}) => TextStyle(
        fontSize: _bodyRegularFontSize,
        fontWeight: _boldWeight,
        color: color ?? _color,
      );

  TextStyle subtitleLight({Color? color}) => TextStyle(
        fontSize: _subtitleFontSize,
        fontWeight: _lightWeight,
        color: color ?? _color,
      );

  TextStyle subtitleRegular({Color? color}) => TextStyle(
        fontSize: _subtitleFontSize,
        fontWeight: _regularWeight,
        color: color ?? _color,
      );

  TextStyle subtitleBold({Color? color}) => TextStyle(
        fontSize: _subtitleFontSize,
        fontWeight: _boldWeight,
        color: color ?? _color,
      );

  TextStyle headerLight({Color? color}) => TextStyle(
        fontSize: _headerFontSize,
        fontWeight: _lightWeight,
        color: color ?? _color,
      );

  TextStyle headerRegular({Color? color}) => TextStyle(
        fontSize: _headerFontSize,
        fontWeight: _regularWeight,
        color: color ?? _color,
      );

  TextStyle headerBold({Color? color}) => TextStyle(
        fontSize: _headerFontSize,
        fontWeight: _boldWeight,
        color: color ?? _color,
      );

  TextStyle titleLight({Color? color}) => TextStyle(
        fontSize: _titleFontSize,
        fontWeight: _lightWeight,
        color: color ?? _color,
      );

  TextStyle titleRegular({Color? color}) => TextStyle(
        fontSize: _titleFontSize,
        fontWeight: _regularWeight,
        color: color ?? _color,
      );

  TextStyle titleBold({Color? color}) => TextStyle(
        fontSize: _titleFontSize,
        fontWeight: _boldWeight,
        color: color ?? _color,
      );

  TextStyle bigTitleLight({Color? color}) => TextStyle(
        fontSize: _bigTitleFontSize,
        fontWeight: _lightWeight,
        color: color ?? _color,
      );

  TextStyle bigTitleRegular({Color? color}) => TextStyle(
        fontSize: _bigTitleFontSize,
        fontWeight: _regularWeight,
        color: color ?? _color,
      );

  TextStyle bigTitleBold({Color? color}) => TextStyle(
        fontSize: _bigTitleFontSize,
        fontWeight: _boldWeight,
        color: color ?? _color,
      );
}
