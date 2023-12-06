# adspostx_flutter

AdsPostX offers a Flutter plugin designed to help you integrate AdsPostX into your Flutter mobile application within minutes and start generating more revenue and increasing sales.

## Integration Guide

please visit [https://docs.adspostx.com/flutter-sdk] to get all details about integrating adspostx_flutter plugin into your Flutter app.

## Usage

### To init AdsPostX.

- sdkId - should be valid SDK ID.

```
Future<void> init(String sdkId, BuildContext context) async {
    bool status = false;
  // show some loading indicator...
    try {
      status = await _adspostxPlugin.init(sdkId);
      // hide loading indicator, if status = true, mean we are ready to load offers now.
    } on PlatformException catch (error) {
      // hide loading indicator, and handle error gracefully.
    }
  }
```

### To Load Offers.

- if you don't want to pass any attributes then pass it as '{}'.
- example of non-empty attribute: {"name": "dev", "country": "usa"}

```
Future<void> loadOffers(Map attributes, BuildContext context) async {
    bool status = false;
    // show loading indicator..
    // in case of no attribute needed, pass {}.

    try {
      status = await _adspostxPlugin.loadOffers(attributes);
    // hide loading indicator, if status = true, mean we are ready to show offers now.
    } on PlatformException catch (error) {
    // hide loading indicator, and handle error gracefully.
    }
  }

```

### To Show Offers.

- presentationStyle = 0 - pop up
- presentationStyle = 1 - full screen
- value of topMargin, rightMargin, bottomMargin, leftMargin should be between 0 to 15.

```
Future<void> showOffers(int presentationStyle, bool isTransparent,
      int topMargin, int rightMargin, int bottomMargin, int leftMargin) async {
    bool status = false;
     try {
      status = await _adspostxPlugin.showOffers(
          presentationStyle,
          isTransparent,
          topMargin,
          rightMargin,
          bottomMargin,
          leftMargin, (dismissStatus) {
        log("Offer dismiss status is: $dismissStatus");
      });
      log("show offers status: $status");
    } on PlatformException catch (error) {
//      utility.showAlert(error.message as String);
    }
  }
```

### To Set Environment

- environment = 0 - for LIVE
- environment = 1 - for TEST

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
