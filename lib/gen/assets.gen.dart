/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $GoogleFontsGen {
  const $GoogleFontsGen();

  /// File path: google_fonts/Montserrat-Black.ttf
  String get montserratBlack => 'google_fonts/Montserrat-Black.ttf';

  /// File path: google_fonts/Montserrat-BlackItalic.ttf
  String get montserratBlackItalic => 'google_fonts/Montserrat-BlackItalic.ttf';

  /// File path: google_fonts/Montserrat-Bold.ttf
  String get montserratBold => 'google_fonts/Montserrat-Bold.ttf';

  /// File path: google_fonts/Montserrat-BoldItalic.ttf
  String get montserratBoldItalic => 'google_fonts/Montserrat-BoldItalic.ttf';

  /// File path: google_fonts/Montserrat-ExtraBold.ttf
  String get montserratExtraBold => 'google_fonts/Montserrat-ExtraBold.ttf';

  /// File path: google_fonts/Montserrat-ExtraBoldItalic.ttf
  String get montserratExtraBoldItalic =>
      'google_fonts/Montserrat-ExtraBoldItalic.ttf';

  /// File path: google_fonts/Montserrat-ExtraLight.ttf
  String get montserratExtraLight => 'google_fonts/Montserrat-ExtraLight.ttf';

  /// File path: google_fonts/Montserrat-ExtraLightItalic.ttf
  String get montserratExtraLightItalic =>
      'google_fonts/Montserrat-ExtraLightItalic.ttf';

  /// File path: google_fonts/Montserrat-Italic.ttf
  String get montserratItalic => 'google_fonts/Montserrat-Italic.ttf';

  /// File path: google_fonts/Montserrat-Light.ttf
  String get montserratLight => 'google_fonts/Montserrat-Light.ttf';

  /// File path: google_fonts/Montserrat-LightItalic.ttf
  String get montserratLightItalic => 'google_fonts/Montserrat-LightItalic.ttf';

  /// File path: google_fonts/Montserrat-Medium.ttf
  String get montserratMedium => 'google_fonts/Montserrat-Medium.ttf';

  /// File path: google_fonts/Montserrat-MediumItalic.ttf
  String get montserratMediumItalic =>
      'google_fonts/Montserrat-MediumItalic.ttf';

  /// File path: google_fonts/Montserrat-Regular.ttf
  String get montserratRegular => 'google_fonts/Montserrat-Regular.ttf';

  /// File path: google_fonts/Montserrat-SemiBold.ttf
  String get montserratSemiBold => 'google_fonts/Montserrat-SemiBold.ttf';

  /// File path: google_fonts/Montserrat-SemiBoldItalic.ttf
  String get montserratSemiBoldItalic =>
      'google_fonts/Montserrat-SemiBoldItalic.ttf';

  /// File path: google_fonts/Montserrat-Thin.ttf
  String get montserratThin => 'google_fonts/Montserrat-Thin.ttf';

  /// File path: google_fonts/Montserrat-ThinItalic.ttf
  String get montserratThinItalic => 'google_fonts/Montserrat-ThinItalic.ttf';

  /// File path: google_fonts/OFL.txt
  String get ofl => 'google_fonts/OFL.txt';

  /// File path: google_fonts/README.txt
  String get readme => 'google_fonts/README.txt';
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/avatar.png
  AssetGenImage get avatar => const AssetGenImage('assets/images/avatar.png');

  /// File path: assets/images/bg.svg
  String get bg => 'assets/images/bg.svg';

  /// File path: assets/images/icon_bg.png
  AssetGenImage get iconBg => const AssetGenImage('assets/images/icon_bg.png');

  /// File path: assets/images/login_bg.jpg
  AssetGenImage get loginBg =>
      const AssetGenImage('assets/images/login_bg.jpg');
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $GoogleFontsGen googleFonts = $GoogleFontsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale = 1.0,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;
}
