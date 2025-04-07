import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';

abstract class Sizer {
  // ignore: deprecated_member_use
  static final Size screenSize = window.physicalSize / window.devicePixelRatio;

  static const Size defaultSize = Size(360, 690);

  static final EdgeInsets padding = EdgeInsets.only(
    // ignore: deprecated_member_use
    left: window.padding.left / window.devicePixelRatio,
    // ignore: deprecated_member_use
    right: window.padding.right / window.devicePixelRatio,
    // ignore: deprecated_member_use
    top: window.padding.top / window.devicePixelRatio,
    // ignore: deprecated_member_use
    bottom: window.padding.bottom / window.devicePixelRatio,
  );

  static final double scaleWidth = screenSize.width / defaultSize.width;

  static final double scaleHeight = screenSize.height / defaultSize.height;

  static double get scaleText => min(scaleWidth, scaleHeight);

  ///widget
  static double get homeScreenTopWidget => 20.sp;

  //
  // /// vertical spacing
  // static double get vs1 => 4.h;
  //
  // static double get vs2 => 3.h;
  //
  // static double get vs3 => 5.h;
  //
  // /// horizontal spacing
  // static double get hs0 => 7.w;
  //
  // static double get hs1 => 10.w;
  //
  // static double get hs2 => 8.w;
  //
  // static double get hs3 => 6.w;
  //
  /// icon size
  static double get iconNavigationSize => 20.sp;

  //
  // static double get iconSizeLarge => 30.sp;
  //
  // static double get iconSizeMedium => 20.sp;
  //
  // static double get textLargeTitle => 18.sp;
  //
  // static double get textSmallTitle => 15.sp;
  //
  // static double get bottomPadding => 10.sp;
  //
  // /// EdgeInsets
  // static EdgeInsets get authPadding => const EdgeInsets.all(20);
  //
  // static EdgeInsets get scaffoldPadding =>
  //     EdgeInsets.fromLTRB(hs2, vs3, hs2, vs2);
  //
  // static EdgeInsets get homePadding => EdgeInsets.symmetric(horizontal: 8.sp);
  //
  // static EdgeInsets get readMorePadding =>
  //     EdgeInsets.symmetric(horizontal: 2.sp);
  //
  // static EdgeInsets get aboutContentPadding =>
  //     EdgeInsets.symmetric(horizontal: 20.sp);
  //
  // static EdgeInsets get aboutDescreptionPadding =>
  //     EdgeInsets.symmetric(horizontal: 25.sp);
  //
  // static EdgeInsets get cardEventPadding =>
  //     EdgeInsets.symmetric(horizontal: 25.sp);
  //
  // static EdgeInsets get speakerItemPadding =>
  //     EdgeInsets.symmetric(horizontal: 30.sp, vertical: 10.sp);
  // static EdgeInsets get buyTicketsItemPadding =>
  //     EdgeInsets.symmetric(horizontal: 30.sp, vertical: 10.sp);
  //
  // static EdgeInsets get bottomSheetPadding =>
  //     EdgeInsets.fromLTRB(hs3, vs3, hs3, vs1);
  ///Padding
  static EdgeInsets get textFiledPadding =>
      EdgeInsets.symmetric(horizontal: 20.sp);

  /// BorderRadius
  static BorderRadius get bottomSheetBorderRadius =>
      const BorderRadius.vertical(top: Radius.circular(10));
}

extension SizerExtention on num {
  double get h => this * Sizer.screenSize.height / 100;

  double get w => this * Sizer.screenSize.width / 100;

  double get sp => this * Sizer.scaleText;
}
