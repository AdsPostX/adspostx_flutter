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
  TextEditingController sdkIdInputCtrl = TextEditingController();
  bool isTransparent = true;
  int presentationStyle = 0; // 0 - pop up , 1 - full screen
  Map<String, String> attributes = {};

  @override
  void initState() {
    super.initState();
  }

  Future<void> setEnvironment(int environment) async {
    bool status = false;
    try {
      status = await _adspostxPlugin.setEnvironment(environment);
      log("setEnvironment status: $status");
      // var utility = Utils(context);
      // utility.showAlert("setEnvironment status: $status");
    } on PlatformException catch (error) {
      log(error.message as String);
    }
  }

  Future<void> enableDebugLog(bool shouldEnable) async {
    bool status = false;
    try {
      status = await _adspostxPlugin.enableDebugLog(shouldEnable);
      log("enableDebugLog status: $status");
      // var utility = Utils(context);
      // utility.showAlert("enableDebugLog status: $status");
    } on PlatformException catch (error) {
      log(error.message as String);
    }
  }

  Future<void> setTimeOut(double seconds) async {
    bool status = false;

    try {
      status = await _adspostxPlugin.setTimeout(seconds);
      log("setTimeOut status: $status");
      // var utility = Utils(context);
      // utility.showAlert("setTimeOut status: $status");
    } on PlatformException catch (error) {
      log(error.message as String);
    }
  }

  Future<void> init(String sdkId, BuildContext context) async {
    bool status = false;
    var utility = Utils(context);
    utility.startLoading();
    try {
      status = await _adspostxPlugin.init(sdkId);
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
        // var utility = Utils(context);
        // utility.showAlert("Offer dismiss status is: $dismissStatus");
      });
      // _showAlert(context, "show offers status: $statusMessage");
      log("show offers status: $status");
      // var utility = Utils(context);
      // utility.showAlert("show offers status: $status");
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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                TextField(
                  controller: sdkIdInputCtrl,
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Enter SDK ID here',
                  ),
                ),
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
                ElevatedButton(
                  onPressed: () => {enableDebugLog(false)},
                  child: const Text("Disable log"),
                ),
                ElevatedButton(
                    onPressed: () =>
                        {init(sdkIdInputCtrl.text.toString(), context)},
                    child: const Text("Init SDK"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    )),
                ElevatedButton(
                    onPressed: () => {
                          attributes = {"name": "dev", "country": "usa"}
                        },
                    child: const Text(
                        "Set Attribute = {name : dev, country: usa}")),
                ElevatedButton(
                    onPressed: () => {attributes = {}},
                    child: const Text("Clear All attribute")),
                ElevatedButton(
                    onPressed: () => {loadOffers(attributes, context)},
                    child: const Text("Load Offers"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    )),
                ElevatedButton(
                  onPressed: () => {isTransparent = true},
                  child: const Text("Set Transparent Background"),
                ),
                ElevatedButton(
                  onPressed: () => {isTransparent = false},
                  child: const Text("Set Non-Transparent Background"),
                ),
                ElevatedButton(
                  onPressed: () => {presentationStyle = 0},
                  child: const Text("Set Popup Style"),
                ),
                ElevatedButton(
                  onPressed: () => {presentationStyle = 1},
                  child: const Text("Set FullScreen Style"),
                ),
                ElevatedButton(
                    onPressed: () => {
                          showOffers(
                              presentationStyle, isTransparent, 5, 5, 5, 5)
                        },
                    child: const Text("Show Offers"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    )),
              ],
            ),
          ),
        ));
  }
}
