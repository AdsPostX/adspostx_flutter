import 'adspostx_flutter_platform_interface.dart';

class AdspostxFlutter {
  Future<bool> setEnvironment(int environment) {
    return AdspostxFlutterPlatform.instance.setEnvironment(environment);
  }

  Future<bool> enableDebugLog(bool isEnabled) {
    return AdspostxFlutterPlatform.instance.enableDebugLog(isEnabled);
  }

  Future<bool> setTimeout(double seconds) {
    return AdspostxFlutterPlatform.instance.setTimeout(seconds);
  }

  Future<bool> init(String accountId) {
    return AdspostxFlutterPlatform.instance.init(accountId);
  }

  Future<bool> loadOffers(Map attributes) {
    return AdspostxFlutterPlatform.instance.loadOffers(attributes);
  }

  Future<bool> showOffers(int presentationStyle, bool isTransparent,
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
