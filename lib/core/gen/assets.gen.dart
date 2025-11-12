// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsLottieAnimationsGen {
  const $AssetsLottieAnimationsGen();

  /// File path: assets/lottie_animations/A fitness cow.json
  String get aFitnessCow => 'assets/lottie_animations/A fitness cow.json';

  /// File path: assets/lottie_animations/Food loading.json
  String get foodLoading => 'assets/lottie_animations/Food loading.json';

  /// File path: assets/lottie_animations/Sandy Loading.json
  String get sandyLoading => 'assets/lottie_animations/Sandy Loading.json';

  /// File path: assets/lottie_animations/Watermelon Fixing.json
  String get watermelonFixing =>
      'assets/lottie_animations/Watermelon Fixing.json';

  /// List of all assets
  List<String> get values => [
    aFitnessCow,
    foodLoading,
    sandyLoading,
    watermelonFixing,
  ];
}

class $AssetsSvgIconsGen {
  const $AssetsSvgIconsGen();

  /// File path: assets/svg_icons/AppleIcon.svg
  SvgGenImage get appleIcon =>
      const SvgGenImage('assets/svg_icons/AppleIcon.svg');

  /// File path: assets/svg_icons/back_icon.svg
  SvgGenImage get backIcon =>
      const SvgGenImage('assets/svg_icons/back_icon.svg');

  /// File path: assets/svg_icons/google_icon.svg
  SvgGenImage get googleIcon =>
      const SvgGenImage('assets/svg_icons/google_icon.svg');

  /// File path: assets/svg_icons/never_back.png
  AssetGenImage get neverBack =>
      const AssetGenImage('assets/svg_icons/never_back.png');

  /// File path: assets/svg_icons/nowln_logo.svg
  SvgGenImage get nowlnLogo =>
      const SvgGenImage('assets/svg_icons/nowln_logo.svg');

  /// File path: assets/svg_icons/sign_un_back_scrren..svg
  SvgGenImage get signUnBackScrren =>
      const SvgGenImage('assets/svg_icons/sign_un_back_scrren..svg');

  /// List of all assets
  List<dynamic> get values => [
    appleIcon,
    backIcon,
    googleIcon,
    neverBack,
    nowlnLogo,
    signUnBackScrren,
  ];
}

class $AssetsSvgImagesGen {
  const $AssetsSvgImagesGen();

  /// File path: assets/svg_images/App Icon.svg
  SvgGenImage get appIcon =>
      const SvgGenImage('assets/svg_images/App Icon.svg');

  /// File path: assets/svg_images/enttry_two_screnn.png
  AssetGenImage get enttryTwoScrenn =>
      const AssetGenImage('assets/svg_images/enttry_two_screnn.png');

  /// File path: assets/svg_images/onboarding.svg
  SvgGenImage get onboarding =>
      const SvgGenImage('assets/svg_images/onboarding.svg');

  /// File path: assets/svg_images/ready_to_start.svg
  SvgGenImage get readyToStart =>
      const SvgGenImage('assets/svg_images/ready_to_start.svg');

  /// File path: assets/svg_images/welcome_back.svg
  SvgGenImage get welcomeBack =>
      const SvgGenImage('assets/svg_images/welcome_back.svg');

  /// List of all assets
  List<dynamic> get values => [
    appIcon,
    enttryTwoScrenn,
    onboarding,
    readyToStart,
    welcomeBack,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsLottieAnimationsGen lottieAnimations =
      $AssetsLottieAnimationsGen();
  static const $AssetsSvgIconsGen svgIcons = $AssetsSvgIconsGen();
  static const $AssetsSvgImagesGen svgImages = $AssetsSvgImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
