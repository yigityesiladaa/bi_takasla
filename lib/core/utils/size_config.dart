import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../base/base_class.dart';
import '../base/base_getx_service.dart';

class SizeConfig extends BaseGetxService {
  late double _height;
  late double _width;
  late double _inch;
  late double _borderRadiusValue;
  late ResponsivePadding _padding;
  double get height => _height;
  double get width => _width;

  ResponsivePadding get padding => _padding;

  late double _heightRatio;
  late double _widthRatio;
  late double _fontRatio;
  late double _inchRatio;

  SizeConfig(BuildContext context) {
    init(context);
  }


  void init(BuildContext context) {
    calculateRatio(
        MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);
    _padding = ResponsivePadding(this);
  }

  void calculateRatio(double newHeight, double newWidth) {
    _height = newHeight.roundToDouble();
    _width = newWidth.roundToDouble();
    _inch = sqrt(pow(_width, 2) + pow(_height, 2)).roundToDouble();
    

    _heightRatio = _height / 1000;
    _widthRatio = _width / 1000;
    _fontRatio = (_width / 3) / 100;
    _inchRatio = _inch / 1000;
    _borderRadiusValue = _width * 0.03;
  }

  void update(BuildContext context) {
    calculateRatio(context.height, context.width);
  }

  double rspHeight(int ratio) => (ratio * _heightRatio).floorToDouble();
  double rspWidth(int ratio) => (ratio * _widthRatio).floorToDouble();

  double rspInch(int ratio) => (ratio * _inchRatio).floorToDouble();
  double rspFontSize(int fontSize) => (fontSize * _fontRatio).floorToDouble();
  double drspFontSize(double fontSize) =>
      (fontSize * _fontRatio).floorToDouble();

  double statusBarHeight(context) =>
      MediaQuery.of(context).padding.top.roundToDouble();
  double statusBarRatio(context) =>
      MediaQuery.of(context).padding.top / _height;

  double get safePaddingTop => Get.mediaQuery.padding.top;
  double get borderRadiusValue => _borderRadiusValue;

}

class ResponsivePadding extends BaseClass {
  SizeConfig sizeConfig;
  ResponsivePadding(this.sizeConfig);

  EdgeInsets get zero => EdgeInsets.zero;

  EdgeInsets only({int left = 0, int top = 0, int right = 0, int bottom = 0}) {
    return EdgeInsets.fromLTRB(
      left.w,
      top.h,
      right.w,
      bottom.h,
    );
  }

  EdgeInsets symmetric({int horizontal = 0, int vertical = 0}) =>
      EdgeInsets.symmetric(
        horizontal: horizontal.w,
        vertical: vertical.h,
      );

  EdgeInsets all(int val) => EdgeInsets.all(val.i);
}

extension ResponsiveFontsize on int {
  SizeConfig get sizeConfig => Get.find<SizeConfig>();
  double get px => sizeConfig.rspFontSize(this);
  double get w => sizeConfig.rspWidth(this);
  double get h => sizeConfig.rspHeight(this);
  double get i => sizeConfig.rspInch(this);
}

extension ResponsiveFontsizeDouble on double {
  SizeConfig get sizeConfig => Get.find<SizeConfig>();
  double get dpx => sizeConfig.drspFontSize(this);
}