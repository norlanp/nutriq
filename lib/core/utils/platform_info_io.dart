import 'dart:io' show Platform;

/// Returns true if running on Android.
bool get isPlatformAndroid => Platform.isAndroid;

/// Returns true if running on iOS.
bool get isPlatformIOS => Platform.isIOS;
