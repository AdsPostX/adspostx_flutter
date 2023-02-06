import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'adspostx_flutter_platform_interface.dart';

/// An implementation of [AdspostxFlutterPlatform] that uses method channels.
class MethodChannelAdspostxFlutter extends AdspostxFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('adspostx_flutter');

  /// It makes debug logs enable/disable.
  /// By default debug logs are disabled.
  /// We don't recommand to enable logs in live environment.
  /// 'isEnabled' must be either true/false.
  /// true - enable debug log.
  /// false - disable debug log.
  /// Returns a bool indicating that if enableDebugLog call is successful or not.
  /// In case of error it can also throw exceptions.  ///
  @override
  Future<bool> enableDebugLog(bool isEnabled) async {
    try {
      final statusMessage = await methodChannel
          .invokeMethod("setDebugLog", {"debugLog": isEnabled});
      return statusMessage;
    } on PlatformException catch (error) {
      log(error.message as String);
      rethrow;
    }
  }

  /// setEnvironment sets environment for serving offers.
  /// 'environment' must be either 0 or 1.
  /// 0 - live environment.
  /// Default is set to 'live environment'.
  /// 1 - test environment.
  /// Returns a bool indicating that if setEnvironment call is successful or not.
  /// In case of error it can also throw exceptions.  ///
  @override
  Future<bool> setEnvironment(int environment) async {
    try {
      final statusMessage = await methodChannel.invokeMethod(
        "setEnvironment",
        {"environment": environment},
      );
      return statusMessage;
    } on PlatformException catch (error) {
      log(error.message as String);
      rethrow;
    }
  }

  /// setTimeOut sets timeout value in seconds.
  /// Used it rarely only when there some problem with offers after loading them.
  /// Returns a bool indicating that if setTimeout call is successful or not.
  /// In case of error it can also throw exceptions.  ///
  @override
  Future<bool> setTimeout(double seconds) async {
    try {
      final statusMessage = await methodChannel.invokeMethod(
        "setTimeOut",
        {"timeout": seconds},
      );
      return statusMessage;
    } on PlatformException catch (error) {
      log(error.message as String);
      rethrow;
    }
  }

  /// Initialize adspostx with accountId, accountId should be non-empty valid String.
  /// Returns a bool indicating that if init call is successful or not.
  /// In case of error it can also throw exceptions.
  @override
  Future<bool> init(String accountId) async {
    try {
      final statusMessage = await methodChannel.invokeMethod(
        "init",
        {"accountId": accountId},
      );
      return statusMessage;
    } on PlatformException catch (error) {
      log(error.message as String);
      rethrow;
    }
  }

  /// LoadOffers with specified attributes, attributes should be of Map type.
  /// attribute key-value should be from specific values which you can get from
  /// adspostx documentation website [https://docs.adspostx.com/].
  /// Returns a bool indicating that if loadOffers call is successful or not.
  /// In case of error it can also throw exceptions.
  @override
  Future<bool> loadOffers(Map attributes) async {
    try {
      final statusMessage = await methodChannel.invokeMethod(
        "loadOffers",
        {"attributes": attributes},
      );
      return statusMessage;
    } on PlatformException catch (error) {
      log(error.message as String);
      rethrow;
    }
  }

  /// ShowOffers with specified configurations.
  /// presentationStyle must be either '0' or '1'. 0 - pop up style, 1 - full screen size.
  /// isTransparent must be either 'true' or 'false' indicates if offer background should be transparent or not.
  /// topMagin must be of int type and value from 0 to 15. it indicates top margin offset in percentage.
  /// rightMagin must be of int type and value from 0 to 15. it indicates right margin offset in percentage.
  /// bottomMargin must be of int type and value from 0 to 15. it indicates bottom margin offset in percentage.
  /// leftMargin must be of int type and value from 0 to 15. it indicates left margin offset in percentage.
  /// Returns a bool indicating that if showOffers call is successful or not.
  /// In case of error it can also throw exceptions.
  @override
  Future<bool> showOffers(
      int presentationStyle,
      bool isTransparent,
      int topMargin,
      int rightMargin,
      int bottomMargin,
      int leftMargin,
      Function(bool) callback) async {
    try {
      final statusMessage = await methodChannel.invokeMethod("showOffers", {
        "presentationStyle": presentationStyle,
        "isTransparent": isTransparent,
        "topMargin": topMargin,
        "rightMargin": rightMargin,
        "bottomMargin": bottomMargin,
        "leftMargin": leftMargin
      });

      methodChannel.setMethodCallHandler((call) async {
        if (call.method == 'onDismiss') {
          // Handle method call
          callback(true);
        }
      });

      return statusMessage;
    } on PlatformException catch (error) {
      log(error.message as String);
      rethrow;
    }
  }
}
