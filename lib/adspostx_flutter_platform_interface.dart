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

  /// It makes debug logs enable/disable.
  /// By default debug logs are disabled.
  /// We don't recommand to enable logs in live environment.
  /// 'isEnabled' must be either true/false.
  /// true - enable debug log.
  /// false - disable debug log.
  /// Returns a bool indicating that if enableDebugLog call is successful or not.
  /// In case of error it can also throw exceptions.  ///
  Future<bool> enableDebugLog(bool isEnabled) async {
    throw UnimplementedError('enableDebugLog() has not been implemented.');
  }

  /// setEnvironment sets environment for serving offers.
  /// 'environment' must be either 0 or 1.
  /// 0 - live environment.
  /// Default is set to 'live environment'.
  /// 1 - test environment.
  /// Returns a bool indicating that if setEnvironment call is successful or not.
  /// In case of error it can also throw exceptions.  ///
  Future<bool> setEnvironment(int environment) async {
    throw UnimplementedError('setEnvironment() has not been implemented.');
  }

  /// setTimeOut sets timeout value in seconds.
  /// Used it rarely only when there some problem with offers after loading them.
  /// Returns a bool indicating that if setTimeout call is successful or not.
  /// In case of error it can also throw exceptions.  ///
  Future<bool> setTimeout(double seconds) async {
    throw UnimplementedError('setTimeout() has not been implemented.');
  }

  /// Initialize adspostx with accountId, accountId should be non-empty valid String.
  /// Returns a bool indicating that if init call is successful or not.
  /// In case of error it can also throw exceptions.
  Future<bool> init(String accountId) async {
    throw UnimplementedError('init() has not been implemented.');
  }

  /// LoadOffers with specified attributes, attributes should be of Map type.
  /// attribute key-value should be from specific values which you can get from
  /// adspostx documentation website [https://docs.adspostx.com/].
  /// Returns a bool indicating that if loadOffers call is successful or not.
  /// In case of error it can also throw exceptions.
  Future<bool> loadOffers(Map attributes) async {
    throw UnimplementedError('loadOffers() has not been implemented.');
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
  Future<bool> showOffers(
      int presentationStyle,
      bool isTransparent,
      int topMargin,
      int rightMargin,
      int bottomMargin,
      int leftMargin,
      Function(bool) callback) async {
    throw UnimplementedError('showOffers() has not been implemented.');
  }
}
