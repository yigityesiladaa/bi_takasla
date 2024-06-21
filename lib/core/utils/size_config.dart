import 'dart:math';
import 'package:bitakasla/core/base/base_class.dart';
import 'package:bitakasla/core/base/base_getx_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SizeConfig extends BaseGetxService {
  late double _height;
  late double _width;
  late double _inch;
  late ResponsivePadding _padding;
  double get height => _height;
  double get width => _width;

  ResponsivePadding get padding => _padding;

  late double _heightRatio;
  late double _widthRatio;
  late double _fontRatio;
  late double _inchRatio;
  static late double hipo;

  //FontSize
  static double? _fontSize8;
  static double? _fontSize9;
  static double? _fontSize10;
  static double? _fontSize11;
  static double? _fontSize12;
  static double? _fontSize13;
  static double? _fontSize14;
  static double? _fontSize15;
  static double? _fontSize16;
  static double? _fontSize17;
  static double? _fontSize18;
  static double? _fontSize19;
  static double? _fontSize20;
  static double? _fontSize22;
  static double? _fontSize24;
  static double? _fontSize27;
  static double? _fontSize29;
  static double? _fontSize34;
  static double? _fontSize42;
  static double? _fontSize50;
  static double? _fontSize80;
  static double? get fontSize8 => _fontSize8;
  static double? get fontSize9 => _fontSize9;
  static double? get fontSize10 => _fontSize10;
  static double? get fontSize11 => _fontSize11;
  static double? get fontSize12 => _fontSize12;
  static double? get fontSize13 => _fontSize13;
  static double? get fontSize14 => _fontSize14;
  static double? get fontSize15 => _fontSize15;
  static double? get fontSize16 => _fontSize16;
  static double? get fontSize17 => _fontSize17;
  static double? get fontSize18 => _fontSize18;
  static double? get fontSize19 => _fontSize19;
  static double? get fontSize20 => _fontSize20;
  static double? get fontSize22 => _fontSize22;
  static double? get fontSize24 => _fontSize24;
  static double? get fontSize27 => _fontSize27;
  static double? get fontSize29 => _fontSize29;
  static double? get fontSize34 => _fontSize34;
  static double? get fontSize42 => _fontSize42;
  static double? get fontSize80 => _fontSize80;
  static double? get fontSize50 => _fontSize50;
  //
  //Icon size
  static double? _iconSizeProfileCard;
  static double? _iconSizeWallet;

  static double? get iconSizeProfileCard => _iconSizeProfileCard;
  static double? get iconSizeWallet => _iconSizeWallet;

  //end
  //kategori bulamadım
  static double? _appBarBoxHeight;
  static double? _instrumentImageSize;
  static double? get appBarBoxHeight => _appBarBoxHeight;
  static double? get instrumentImageSize => _instrumentImageSize;

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

    hipo = sqrt((_height * _height) + (_width * _width));

    //FontSize
    _fontSize8 = (hipo * 0.0096).roundToDouble();
    _fontSize9 = (hipo * 0.0108).roundToDouble();
    _fontSize10 = (hipo * 0.012).roundToDouble();
    _fontSize11 = (hipo * 0.0132).roundToDouble();
    _fontSize12 = (hipo * 0.0144).roundToDouble();
    _fontSize13 = (hipo * 0.0156).roundToDouble();
    _fontSize14 = (hipo * 0.01677).roundToDouble();
    _fontSize15 = (hipo * 0.018).roundToDouble();
    _fontSize16 = (hipo * 0.0192).roundToDouble();
    _fontSize17 = (hipo * 0.0204).roundToDouble();
    _fontSize18 = (hipo * 0.0216).roundToDouble();
    _fontSize19 = (hipo * 0.0228).roundToDouble();
    _fontSize20 = (hipo * 0.024).roundToDouble();
    _fontSize22 = (hipo * 0.026).roundToDouble();
    _fontSize24 = (hipo * 0.0288).roundToDouble();
    _fontSize27 = (hipo * 0.034).roundToDouble();
    _fontSize29 = (hipo * 0.0363).roundToDouble();
    _fontSize34 = (hipo * 0.055).roundToDouble();
    _fontSize42 = (hipo * 0.058).roundToDouble();
    _fontSize50 = (hipo * 0.063).roundToDouble();
    _fontSize80 = (hipo * 0.1).roundToDouble();

    // logger.wtf(hipo*0.058);

    //Icon size
    _iconSizeProfileCard = (hipo * 0.025).toDouble();
    _iconSizeWallet = (hipo * 0.05).toDouble();

    _appBarBoxHeight = hipo * 0.06;
    _instrumentImageSize = _width * 0.08;
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