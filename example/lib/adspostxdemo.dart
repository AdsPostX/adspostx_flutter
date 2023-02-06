import 'dart:developer';

import 'package:adspostx_flutter/adspostx_flutter.dart';
import 'package:adspostx_flutter_example/utils.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'dart:async';

class AdsPostXDemo extends StatefulWidget {
  const AdsPostXDemo({super.key});

  @override
  State<AdsPostXDemo> createState() => _AdsPostXDemoState();
}

class _AdsPostXDemoState extends State<AdsPostXDemo> {
  final _adspostxPlugin = AdspostxFlutter();
  TextEditingController accountIdInputCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> setEnvironment(int environment) async {
    bool status = false;
    try {
      status = await _adspostxPlugin.setEnvironment(environment);
      log("setEnvironment status: $status");
    } on PlatformException catch (error) {
      log(error.message as String);
    }
  }

  Future<void> enableDebugLog(bool shouldEnable) async {
    bool status = false;
    try {
      status = await _adspostxPlugin.enableDebugLog(shouldEnable);
      log("enableDebugLog status: $status");
    } on PlatformException catch (error) {
      log(error.message as String);
    }
  }

  Future<void> setTimeOut(double seconds) async {
    bool status = false;

    try {
      status = await _adspostxPlugin.setTimeout(seconds);
      log("setTimeOut status: $status");
    } on PlatformException catch (error) {
      log(error.message as String);
    }
  }

  Future<void> init(String accountId, BuildContext context) async {
    bool status = false;
    var utility = Utils(context);
    utility.startLoading();
    try {
      status = await _adspostxPlugin.init(accountId);
      utility.stopLoading();
      utility.showAlert("init status: $status");
    } on PlatformException catch (error) {
      utility.stopLoading();
      utility.showAlert(error.message as String);
    }
  }

  Future<void> loadOffers(Map attributes, BuildContext context) async {
    bool status = false;
    var utility = Utils(context);
    utility.startLoading();
    try {
      status = await _adspostxPlugin.loadOffers(attributes);
      utility.stopLoading();
      utility.showAlert("loadOffers status: $status");
    } on PlatformException catch (error) {
      Utils(context).stopLoading();
      utility.showAlert(error.message as String);
    }
  }

  Future<void> showOffers(int presentationStyle, bool isTransparent,
      int topMargin, int rightMargin, int bottomMargin, int leftMargin) async {
    bool status = false;
    var utility = Utils(context);
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
      // _showAlert(context, "show offers status: $statusMessage");
      log("show offers status: $status");
    } on PlatformException catch (error) {
      utility.showAlert(error.message as String);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: accountIdInputCtrl,
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Enter AccountID here',
              ),
            ),
            ElevatedButton(
                onPressed: () =>
                    {init(accountIdInputCtrl.text.toString(), context)},
                child: const Text("Init SDK")),
            ElevatedButton(
                onPressed: () => {loadOffers({}, context)},
                child: const Text("Load Offers")),
            ElevatedButton(
                onPressed: () => {showOffers(0, true, 5, 5, 5, 5)},
                child: const Text("Show Offers")),
            ElevatedButton(
                onPressed: () => {setEnvironment(0)},
                child: const Text("Set Live Environment")),
            ElevatedButton(
                onPressed: () => {setEnvironment(1)},
                child: const Text("Set Test Environment")),
            ElevatedButton(
              onPressed: () => {enableDebugLog(true)},
              child: const Text("Enable log"),
            ),
          ],
        ),
      ),
    );
  }
}
