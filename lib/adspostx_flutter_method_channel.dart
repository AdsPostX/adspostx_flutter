import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'adspostx_flutter_platform_interface.dart';

/// An implementation of [AdspostxFlutterPlatform] that uses method channels.
class MethodChannelAdspostxFlutter extends AdspostxFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('adspostx_flutter');

  @override
  Future<String> enableDebugLog(bool isEnabled) async {
    try {
      final statusMessage = await methodChannel
          .invokeMethod("setDebugLog", {"debugLog": isEnabled});
      return statusMessage;
    } on PlatformException catch (error) {
      log(error.message as String);
      rethrow;
    }
  }

  @override
  Future<String> setEnvironment(int environment) async {
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

  @override
  Future<String> setTimeout(double seconds) async {
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

  @override
  Future<String> initSDK(String accountId) async {
    try {
      final statusMessage = await methodChannel.invokeMethod(
        "initSDK",
        {"accountId": accountId},
      );
      return statusMessage;
    } on PlatformException catch (error) {
      log(error.message as String);
      rethrow;
    }
  }

  @override
  Future<String> loadOffers(Map attributes) async {
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

  @override
  Future<String> showOffers(
    int presentationStyle,
    bool isTransparent,
    int topMargin,
    int rightMargin,
    int bottomMargin,
    int leftMargin,
  ) async {
    try {
      final statusMessage = await methodChannel.invokeMethod("showOffers", {
        "presentationStyle": presentationStyle,
        "isTransparent": isTransparent,
        "topMargin": topMargin,
        "rightMargin": rightMargin,
        "bottomMargin": bottomMargin,
        "leftMargin": leftMargin
      });
      return statusMessage;
    } on PlatformException catch (error) {
      log(error.message as String);
      rethrow;
    }
  }
}
