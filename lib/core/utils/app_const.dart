import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:package_info_plus/package_info_plus.dart';

import 'package:nutriq/core/utils/platform_info_io.dart'
    if (dart.library.html) 'package:nutriq/core/utils/platform_info_web.dart'
    as platform_info;

class AppConst {
  static const userAgentAppName = "Nutriq";
  static const platformNameAndroid = "Android";
  static const platformNameIOS = "iOS";
  static const platformNameWeb = "Web";
  static const reportErrorEmail = "nutriq-dev@pm.me";
  static const sourceCodeUrl = "https://github.com/simonoppowa/Nutriq";

  static Future<String> getVersionNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  static String getPlatformName() {
    if (kIsWeb) return platformNameWeb;
    if (platform_info.isPlatformAndroid) {
      return platformNameAndroid;
    } else if (platform_info.isPlatformIOS) {
      return platformNameIOS;
    } else {
      return platformNameWeb;
    }
  }

  static Future<String> getUserAgentString() async {
    final versionNumber = await getVersionNumber();
    final platformVersion = getPlatformName();
    return '$userAgentAppName - $platformVersion - Version $versionNumber - $sourceCodeUrl';
  }
}
