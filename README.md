# adspostx_flutter

AdsPostX offers a flutter plugin designed to help you integrate AdsPostX into your flutter mobile application within minutes and start generating more revenue and increasing sales.

## Integration Guide

please visit [https://docs.adspostx.com/flutter-sdk] to get all details about integrating adspostx_flutter plugin into your Flutter app.

## Usage

### To init AdsPostX.

```
Future<void> init(String accountId, BuildContext context) async {
    bool status = false;
  // show some loading indicator...
    try {
      status = await _adspostxPlugin.init(accountId);
      // hide loading indicator, if status = true, mean we are ready to load offers now.
    } on PlatformException catch (error) {
      // hide loading indicator, and handle error gracefully.
    }
  }
```

### To Load Offers.

```
Future<void> loadOffers(Map attributes, BuildContext context) async {
    bool status = false;
    // show loading indicator..
    try {
      status = await _adspostxPlugin.loadOffers(attributes);
    // hide loading indicator, if status = true, mean we are ready to show offers now.
    } on PlatformException catch (error) {
    // hide loading indicator, and handle error gracefully.
    }
  }

```

### To Show Offers.

```
Future<void> showOffers(int presentationStyle, bool isTransparent,
      int topMargin, int rightMargin, int bottomMargin, int leftMargin) async {
    bool status = false;
    try {
      status = await _adspostxPlugin.showOffers(presentationStyle,
          isTransparent, topMargin, rightMargin, bottomMargin, leftMargin);
      // _showAlert(context, "show offers status: $statusMessage");
      log("show offers status: $status");
    } on PlatformException catch (error) {
      log(error.message as String);
    }
  }
```

### To Set Environment

```
Future<void> setEnvironment(int environment) async {
      // environment must be either 0 or 1. 0 - live environment, 1 - test environment.
    bool status = false;
    try {
      status = await _adspostxPlugin.setEnvironment(environment);
      log("setEnvironment status: $status");
    } on PlatformException catch (error) {
      log(error.message as String);
    }
  }
```

### To Enable DebugLog

```
Future<void> enableDebugLog(bool shouldEnable) async {
    bool status = false;
    try {
      status = await _adspostxPlugin.enableDebugLog(shouldEnable);
      log("enableDebugLog status: $status");
    } on PlatformException catch (error) {
      log(error.message as String);
    }
  }
```
