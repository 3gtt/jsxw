// IT IS GENERATED BY FLR - DO NOT MODIFY BY HAND
// YOU CAN GET MORE DETAILS ABOUT FLR FROM:
// - https://github.com/Fly-Mix/flr-cli
// - https://github.com/Fly-Mix/flr-vscode-extension
// - https://github.com/Fly-Mix/flr-as-plugin
//

// ignore: unused_import
import 'package:flutter/widgets.dart';
// ignore: unused_import
import 'package:flutter/services.dart' show rootBundle;
// ignore: unused_import
import 'package:path/path.dart' as path;
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';
// ignore: unused_import
import 'package:r_dart_library/asset_svg.dart';

/// This `R` class is generated and contains references to static asset resources.
class R {
  /// package name: com_3gtt_jsxw
  static const package = "com_3gtt_jsxw";

  /// This `R.image` struct is generated, and contains static references to static non-svg type image asset resources.
  static const image = _R_Image();

  /// This `R.svg` struct is generated, and contains static references to static svg type image asset resources.
  static const svg = _R_Svg();

  /// This `R.text` struct is generated, and contains static references to static text asset resources.
  static const text = _R_Text();

  /// This `R.fontFamily` struct is generated, and contains static references to static font asset resources.
  static const fontFamily = _R_FontFamily();
}

/// Asset resource’s metadata class.
/// For example, here is the metadata of `packages/flutter_demo/assets/images/example.png` asset:
/// - packageName：flutter_demo
/// - assetName：assets/images/example.png
/// - fileDirname：assets/images
/// - fileBasename：example.png
/// - fileBasenameNoExtension：example
/// - fileExtname：.png
class AssetResource {
  /// Creates an object to hold the asset resource’s metadata.
  const AssetResource(this.assetName, {this.packageName});

  /// The name of the main asset from the set of asset resources to choose from.
  final String assetName;

  /// The name of the package from which the asset resource is included.
  final String? packageName;

  /// The name used to generate the key to obtain the asset resource. For local assets
  /// this is [assetName], and for assets from packages the [assetName] is
  /// prefixed 'packages/<package_name>/'.
  String get keyName =>
      packageName == null ? assetName : "packages/$packageName/$assetName";

  /// The file basename of the asset resource.
  String get fileBasename {
    final basename = path.basename(assetName);
    return basename;
  }

  /// The no extension file basename of the asset resource.
  String get fileBasenameNoExtension {
    final basenameWithoutExtension = path.basenameWithoutExtension(assetName);
    return basenameWithoutExtension;
  }

  /// The file extension name of the asset resource.
  String get fileExtname {
    final extension = path.extension(assetName);
    return extension;
  }

  /// The directory path name of the asset resource.
  String get fileDirname {
    var dirname = assetName;
    if (packageName != null) {
      final packageStr = "packages/$packageName/";
      dirname = dirname.replaceAll(packageStr, "");
    }
    final filenameStr = "$fileBasename/";
    dirname = dirname.replaceAll(filenameStr, "");
    return dirname;
  }
}

// ignore: camel_case_types
class _R_Image_AssetResource {
  const _R_Image_AssetResource();

  /// asset: lib/assets/images/arsenal/icon_1.png
  // ignore: non_constant_identifier_names
  final icon_1 = const AssetResource("assets/images/arsenal/icon_1.png",
      packageName: R.package);

  /// asset: lib/assets/images/arsenal/icon_10.png
  // ignore: non_constant_identifier_names
  final icon_10 = const AssetResource("assets/images/arsenal/icon_10.png",
      packageName: R.package);

  /// asset: lib/assets/images/arsenal/icon_101.png
  // ignore: non_constant_identifier_names
  final icon_101 = const AssetResource("assets/images/arsenal/icon_101.png",
      packageName: R.package);

  /// asset: lib/assets/images/arsenal/icon_102.png
  // ignore: non_constant_identifier_names
  final icon_102 = const AssetResource("assets/images/arsenal/icon_102.png",
      packageName: R.package);

  /// asset: lib/assets/images/arsenal/icon_103.png
  // ignore: non_constant_identifier_names
  final icon_103 = const AssetResource("assets/images/arsenal/icon_103.png",
      packageName: R.package);

  /// asset: lib/assets/images/arsenal/icon_104.png
  // ignore: non_constant_identifier_names
  final icon_104 = const AssetResource("assets/images/arsenal/icon_104.png",
      packageName: R.package);

  /// asset: lib/assets/images/arsenal/icon_105.png
  // ignore: non_constant_identifier_names
  final icon_105 = const AssetResource("assets/images/arsenal/icon_105.png",
      packageName: R.package);

  /// asset: lib/assets/images/arsenal/icon_106.png
  // ignore: non_constant_identifier_names
  final icon_106 = const AssetResource("assets/images/arsenal/icon_106.png",
      packageName: R.package);

  /// asset: lib/assets/images/arsenal/icon_107.png
  // ignore: non_constant_identifier_names
  final icon_107 = const AssetResource("assets/images/arsenal/icon_107.png",
      packageName: R.package);

  /// asset: lib/assets/images/arsenal/icon_108.png
  // ignore: non_constant_identifier_names
  final icon_108 = const AssetResource("assets/images/arsenal/icon_108.png",
      packageName: R.package);

  /// asset: lib/assets/images/arsenal/icon_11.png
  // ignore: non_constant_identifier_names
  final icon_11 = const AssetResource("assets/images/arsenal/icon_11.png",
      packageName: R.package);

  /// asset: lib/assets/images/arsenal/icon_12.png
  // ignore: non_constant_identifier_names
  final icon_12 = const AssetResource("assets/images/arsenal/icon_12.png",
      packageName: R.package);

  /// asset: lib/assets/images/arsenal/icon_13.png
  // ignore: non_constant_identifier_names
  final icon_13 = const AssetResource("assets/images/arsenal/icon_13.png",
      packageName: R.package);

  /// asset: lib/assets/images/arsenal/icon_14.png
  // ignore: non_constant_identifier_names
  final icon_14 = const AssetResource("assets/images/arsenal/icon_14.png",
      packageName: R.package);

  /// asset: lib/assets/images/arsenal/icon_15.png
  // ignore: non_constant_identifier_names
  final icon_15 = const AssetResource("assets/images/arsenal/icon_15.png",
      packageName: R.package);

  /// asset: lib/assets/images/arsenal/icon_16.png
  // ignore: non_constant_identifier_names
  final icon_16 = const AssetResource("assets/images/arsenal/icon_16.png",
      packageName: R.package);

  /// asset: lib/assets/images/arsenal/icon_2.png
  // ignore: non_constant_identifier_names
  final icon_2 = const AssetResource("assets/images/arsenal/icon_2.png",
      packageName: R.package);

  /// asset: lib/assets/images/arsenal/icon_3.png
  // ignore: non_constant_identifier_names
  final icon_3 = const AssetResource("assets/images/arsenal/icon_3.png",
      packageName: R.package);

  /// asset: lib/assets/images/arsenal/icon_4.png
  // ignore: non_constant_identifier_names
  final icon_4 = const AssetResource("assets/images/arsenal/icon_4.png",
      packageName: R.package);

  /// asset: lib/assets/images/arsenal/icon_5.png
  // ignore: non_constant_identifier_names
  final icon_5 = const AssetResource("assets/images/arsenal/icon_5.png",
      packageName: R.package);

  /// asset: lib/assets/images/arsenal/icon_6.png
  // ignore: non_constant_identifier_names
  final icon_6 = const AssetResource("assets/images/arsenal/icon_6.png",
      packageName: R.package);

  /// asset: lib/assets/images/arsenal/icon_7.png
  // ignore: non_constant_identifier_names
  final icon_7 = const AssetResource("assets/images/arsenal/icon_7.png",
      packageName: R.package);

  /// asset: lib/assets/images/arsenal/icon_8.png
  // ignore: non_constant_identifier_names
  final icon_8 = const AssetResource("assets/images/arsenal/icon_8.png",
      packageName: R.package);

  /// asset: lib/assets/images/arsenal/icon_9.png
  // ignore: non_constant_identifier_names
  final icon_9 = const AssetResource("assets/images/arsenal/icon_9.png",
      packageName: R.package);

  /// asset: lib/assets/images/arsenal/icon_all.png
  // ignore: non_constant_identifier_names
  final icon_all = const AssetResource("assets/images/arsenal/icon_all.png",
      packageName: R.package);

  /// asset: lib/assets/images/tabbar/tabbar_1.png
  // ignore: non_constant_identifier_names
  final tabbar_1 = const AssetResource("assets/images/tabbar/tabbar_1.png",
      packageName: R.package);

  /// asset: lib/assets/images/tabbar/tabbar_2.png
  // ignore: non_constant_identifier_names
  final tabbar_2 = const AssetResource("assets/images/tabbar/tabbar_2.png",
      packageName: R.package);

  /// asset: lib/assets/images/tabbar/tabbar_3.png
  // ignore: non_constant_identifier_names
  final tabbar_3 = const AssetResource("assets/images/tabbar/tabbar_3.png",
      packageName: R.package);

  /// asset: lib/assets/images/tabbar/tabbar_4.png
  // ignore: non_constant_identifier_names
  final tabbar_4 = const AssetResource("assets/images/tabbar/tabbar_4.png",
      packageName: R.package);

  /// asset: lib/assets/images/tabbar/tabbar_5.png
  // ignore: non_constant_identifier_names
  final tabbar_5 = const AssetResource("assets/images/tabbar/tabbar_5.png",
      packageName: R.package);
}

// ignore: camel_case_types
class _R_Svg_AssetResource {
  const _R_Svg_AssetResource();
}

// ignore: camel_case_types
class _R_Text_AssetResource {
  const _R_Text_AssetResource();

  /// asset: lib/assets/texts/weapons_home.json
  // ignore: non_constant_identifier_names
  final weapons_home_json = const AssetResource(
      "assets/texts/weapons_home.json",
      packageName: R.package);
}

/// This `_R_Image` class is generated and contains references to static non-svg type image asset resources.
// ignore: camel_case_types
class _R_Image {
  const _R_Image();

  final asset = const _R_Image_AssetResource();

  /// asset: lib/assets/images/arsenal/icon_1.png
  // ignore: non_constant_identifier_names
  AssetImage icon_1() {
    return AssetImage(asset.icon_1.keyName);
  }

  /// asset: lib/assets/images/arsenal/icon_10.png
  // ignore: non_constant_identifier_names
  AssetImage icon_10() {
    return AssetImage(asset.icon_10.keyName);
  }

  /// asset: lib/assets/images/arsenal/icon_101.png
  // ignore: non_constant_identifier_names
  AssetImage icon_101() {
    return AssetImage(asset.icon_101.keyName);
  }

  /// asset: lib/assets/images/arsenal/icon_102.png
  // ignore: non_constant_identifier_names
  AssetImage icon_102() {
    return AssetImage(asset.icon_102.keyName);
  }

  /// asset: lib/assets/images/arsenal/icon_103.png
  // ignore: non_constant_identifier_names
  AssetImage icon_103() {
    return AssetImage(asset.icon_103.keyName);
  }

  /// asset: lib/assets/images/arsenal/icon_104.png
  // ignore: non_constant_identifier_names
  AssetImage icon_104() {
    return AssetImage(asset.icon_104.keyName);
  }

  /// asset: lib/assets/images/arsenal/icon_105.png
  // ignore: non_constant_identifier_names
  AssetImage icon_105() {
    return AssetImage(asset.icon_105.keyName);
  }

  /// asset: lib/assets/images/arsenal/icon_106.png
  // ignore: non_constant_identifier_names
  AssetImage icon_106() {
    return AssetImage(asset.icon_106.keyName);
  }

  /// asset: lib/assets/images/arsenal/icon_107.png
  // ignore: non_constant_identifier_names
  AssetImage icon_107() {
    return AssetImage(asset.icon_107.keyName);
  }

  /// asset: lib/assets/images/arsenal/icon_108.png
  // ignore: non_constant_identifier_names
  AssetImage icon_108() {
    return AssetImage(asset.icon_108.keyName);
  }

  /// asset: lib/assets/images/arsenal/icon_11.png
  // ignore: non_constant_identifier_names
  AssetImage icon_11() {
    return AssetImage(asset.icon_11.keyName);
  }

  /// asset: lib/assets/images/arsenal/icon_12.png
  // ignore: non_constant_identifier_names
  AssetImage icon_12() {
    return AssetImage(asset.icon_12.keyName);
  }

  /// asset: lib/assets/images/arsenal/icon_13.png
  // ignore: non_constant_identifier_names
  AssetImage icon_13() {
    return AssetImage(asset.icon_13.keyName);
  }

  /// asset: lib/assets/images/arsenal/icon_14.png
  // ignore: non_constant_identifier_names
  AssetImage icon_14() {
    return AssetImage(asset.icon_14.keyName);
  }

  /// asset: lib/assets/images/arsenal/icon_15.png
  // ignore: non_constant_identifier_names
  AssetImage icon_15() {
    return AssetImage(asset.icon_15.keyName);
  }

  /// asset: lib/assets/images/arsenal/icon_16.png
  // ignore: non_constant_identifier_names
  AssetImage icon_16() {
    return AssetImage(asset.icon_16.keyName);
  }

  /// asset: lib/assets/images/arsenal/icon_2.png
  // ignore: non_constant_identifier_names
  AssetImage icon_2() {
    return AssetImage(asset.icon_2.keyName);
  }

  /// asset: lib/assets/images/arsenal/icon_3.png
  // ignore: non_constant_identifier_names
  AssetImage icon_3() {
    return AssetImage(asset.icon_3.keyName);
  }

  /// asset: lib/assets/images/arsenal/icon_4.png
  // ignore: non_constant_identifier_names
  AssetImage icon_4() {
    return AssetImage(asset.icon_4.keyName);
  }

  /// asset: lib/assets/images/arsenal/icon_5.png
  // ignore: non_constant_identifier_names
  AssetImage icon_5() {
    return AssetImage(asset.icon_5.keyName);
  }

  /// asset: lib/assets/images/arsenal/icon_6.png
  // ignore: non_constant_identifier_names
  AssetImage icon_6() {
    return AssetImage(asset.icon_6.keyName);
  }

  /// asset: lib/assets/images/arsenal/icon_7.png
  // ignore: non_constant_identifier_names
  AssetImage icon_7() {
    return AssetImage(asset.icon_7.keyName);
  }

  /// asset: lib/assets/images/arsenal/icon_8.png
  // ignore: non_constant_identifier_names
  AssetImage icon_8() {
    return AssetImage(asset.icon_8.keyName);
  }

  /// asset: lib/assets/images/arsenal/icon_9.png
  // ignore: non_constant_identifier_names
  AssetImage icon_9() {
    return AssetImage(asset.icon_9.keyName);
  }

  /// asset: lib/assets/images/arsenal/icon_all.png
  // ignore: non_constant_identifier_names
  AssetImage icon_all() {
    return AssetImage(asset.icon_all.keyName);
  }

  /// asset: lib/assets/images/tabbar/tabbar_1.png
  // ignore: non_constant_identifier_names
  AssetImage tabbar_1() {
    return AssetImage(asset.tabbar_1.keyName);
  }

  /// asset: lib/assets/images/tabbar/tabbar_2.png
  // ignore: non_constant_identifier_names
  AssetImage tabbar_2() {
    return AssetImage(asset.tabbar_2.keyName);
  }

  /// asset: lib/assets/images/tabbar/tabbar_3.png
  // ignore: non_constant_identifier_names
  AssetImage tabbar_3() {
    return AssetImage(asset.tabbar_3.keyName);
  }

  /// asset: lib/assets/images/tabbar/tabbar_4.png
  // ignore: non_constant_identifier_names
  AssetImage tabbar_4() {
    return AssetImage(asset.tabbar_4.keyName);
  }

  /// asset: lib/assets/images/tabbar/tabbar_5.png
  // ignore: non_constant_identifier_names
  AssetImage tabbar_5() {
    return AssetImage(asset.tabbar_5.keyName);
  }
}

/// This `_R_Svg` class is generated and contains references to static svg type image asset resources.
// ignore: camel_case_types
class _R_Svg {
  const _R_Svg();

  final asset = const _R_Svg_AssetResource();
}

/// This `_R_Text` class is generated and contains references to static text asset resources.
// ignore: camel_case_types
class _R_Text {
  const _R_Text();

  final asset = const _R_Text_AssetResource();

  /// asset: lib/assets/texts/weapons_home.json
  // ignore: non_constant_identifier_names
  Future<String> weapons_home_json() {
    final str = rootBundle.loadString(asset.weapons_home_json.keyName);
    return str;
  }
}

/// This `_R_FontFamily` class is generated and contains references to static font asset resources.
// ignore: camel_case_types
class _R_FontFamily {
  const _R_FontFamily();
}