import 'adspostx_flutter_platform_interface.dart';

class AdspostxFlutter {
  Future<String> setEnvironment(int environment) {
    return AdspostxFlutterPlatform.instance.setEnvironment(environment);
  }

  Future<String> enableDebugLog(bool isEnabled) {
    return AdspostxFlutterPlatform.instance.enableDebugLog(isEnabled);
  }

  Future<String> setTimeout(double seconds) {
    return AdspostxFlutterPlatform.instance.setTimeout(seconds);
  }

  Future<String> initSDK(String accountId) {
    return AdspostxFlutterPlatform.instance.initSDK(accountId);
  }

  Future<String> loadOffers(Map attributes) {
    return AdspostxFlutterPlatform.instance.loadOffers(attributes);
  }

  Future<String> showOffers(int presentationStyle, bool isTransparent,
      int topMargin, int rightMargin, int bottomMargin, int leftMargin) {
    return AdspostxFlutterPlatform.instance.showOffers(
      presentationStyle,
      isTransparent,
      topMargin,
      rightMargin,
      bottomMargin,
      leftMargin,
    );
  }
}
