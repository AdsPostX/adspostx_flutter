import Flutter
import UIKit
import AdsPostX

public class SwiftAdspostxFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "adspostx_flutter", binaryMessenger: registrar.messenger())
    let instance = SwiftAdspostxFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    
            if(call.method == "initSDK") {
            if let data = call.arguments as? Dictionary<String, Any> {
                let accountId: String = data["accountId"] as? String ?? ""
                AdsPostx.initWith(accountId: accountId) { _result in
                    switch _result {
                    case .success():
                        result("success")
                    case .failure(let error):
                        if let err = error as? AdsPostxError {
                            result(FlutterError(code: "ERROR",
                                                message: err.description,
                                                details: nil))
                        }
                    }
                }
            }
        } else if(call.method == "loadOffers") {
            if let data = call.arguments as? Dictionary<String, Any> {
                if let attributes = data["attributes"] as? Dictionary<String, Any> {
                    print("attributes : ", attributes)
                    AdsPostx.load(attributes: attributes) { _result in
                        switch _result {
                        case .success():
                            result("success")
                        case .failure(let error):
                            if let err = error as? AdsPostxError {
                                result(FlutterError(code: "ERROR",
                                                    message: err.description,
                                                    details: nil))
                            }
                        }
                    }
                }
            }
            
        } else if(call.method == "showOffers") {
            if let data = call.arguments as? Dictionary<String, Any> {
                let presentationStyle: Int = data["presentationStyle"] as? Int ?? 0
                let isTransparent: Bool = data["isTransparent"] as? Bool ?? true
                let topMargin: Int = data["topMargin"] as? Int ?? 0
                let rightMargin: Int = data["rightMargin"] as? Int ?? 0
                let bottomMargin: Int = data["bottomMargin"] as? Int ?? 0
                let leftMargin: Int = data["leftMargin"] as? Int ?? 0
                let style: OfferPresentationStyle = presentationStyle == 0 ? OfferPresentationStyle.popup : OfferPresentationStyle.fullScreen
                print("presentationStyle: ", presentationStyle)
                print("env : ", AdsPostx.getEnvironment())
                print("isTransparent : ",isTransparent)
                print("topMargin : ",topMargin)
                print("rightMargin : ",rightMargin)
                print("bottomMargin : ",bottomMargin)
                print("leftMargin : ",leftMargin)
                print("style : ",style)
                AdsPostx.showOffers(presentationStyle: style,transparent: isTransparent, margins: (top: UInt(topMargin), bottom: UInt(bottomMargin), left: UInt(leftMargin), right: UInt(rightMargin))) {
                    result("success")
                } onError: { error in
                    if let err = error as? AdsPostxError {
                        result(FlutterError(code: "ERROR",
                                            message: err.description,
                                            details: nil))
                    }
                } onDismiss: {
                    
                }
                
            }
            
        } else if(call.method == "setEnvironment") {
            if let data = call.arguments as? Dictionary<String, Any> {
                print("env : ", data["environment"])
                let env: Int = data["environment"] as? Int ?? 0
                print("env: ", env)
                AdsPostx.SetEnvironment(env == 0 ? .live : .test)
                result("success")
            }
        } else if(call.method == "setDebugLog") {
            if let data = call.arguments as? Dictionary<String, Any> {
                let isDebugEnabled: Bool = data["debugLog"] as? Bool ?? false
                AdsPostx.EnableDebugLog(isDebugEnabled)
                result("success")
            }
        } else if(call.method == "setTimeOut") {
            if let data = call.arguments as? Dictionary<String, Any> {
                let timeOut: Double = data["timeout"] as? Double ?? 10.0
                AdsPostx.setTimeOut(seconds: timeOut)
                result("success")
            }
        }
        else {
            result(FlutterMethodNotImplemented)
        }

  }
}
