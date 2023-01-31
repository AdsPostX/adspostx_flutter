import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'adspostx_flutter_method_channel.dart';

abstract class AdspostxFlutterPlatform extends PlatformInterface {
  /// Constructs a AdspostxFlutterPlatform.
  AdspostxFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static AdspostxFlutterPlatform _instance = MethodChannelAdspostxFlutter();

  /// The default instance of [AdspostxFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelAdspostxFlutter].
  static AdspostxFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AdspostxFlutterPlatform] when
  /// they register themselves.
  static set instance(AdspostxFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String> enableDebugLog(bool isEnabled) async {
    throw UnimplementedError('enableDebugLog() has not been implemented.');
  }

  Future<String> setEnvironment(int environment) async {
    throw UnimplementedError('setEnvironment() has not been implemented.');
  }

  Future<String> setTimeout(double seconds) async {
    throw UnimplementedError('setTimeout() has not been implemented.');
  }

  Future<String> initSDK(String accountId) async {
    throw UnimplementedError('initSDK() has not been implemented.');
  }

  Future<String> loadOffers(Map attributes) async {
    throw UnimplementedError('loadOffers() has not been implemented.');
  }

  Future<String> showOffers(
      int presentationStyle,
      bool isTransparent,
      int topMargin,
      int rightMargin,
      int bottomMargin,
      int leftMargin,
      ) async {
    throw UnimplementedError('showOffers() has not been implemented.');
  }

}
