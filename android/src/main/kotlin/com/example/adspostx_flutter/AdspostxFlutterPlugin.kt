package com.example.adspostx_flutter

import androidx.annotation.NonNull
import com.adspostx.sdk.*
import android.content.Context
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** AdspostxFlutterPlugin */
class AdspostxFlutterPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private  lateinit var context: Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "adspostx_flutter")
    context = flutterPluginBinding.applicationContext
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if(call.method == "initSDK") {
      val data: HashMap<String,Any> =  call.arguments as HashMap<String,Any>
      val accountId: String = (data["accountId"] as String?) ?: ""

      AdsPostX.init(accountId) { status, error ->
        if (status) {
          result.success("success")
        } else {
          if (error != null) {
            result.error("ERROR",error.message,null)
          } else {
            result.error("ERROR","Unknown error",null)
          }
        }
      }
    } else if(call.method == "loadOffers") {
      val data: HashMap<String,Any> =  call.arguments as HashMap<String,Any>
      val attributes: Map<String,String>? = data["attributes"] as Map<String, String>?
      attributes?.let {

          AdsPostX.load(context, it) { status, error ->
                  if (status) {
                      result.success("success")
                  } else {
                      if (error != null) {
                          result.error("ERROR", error.message, null)
                      } else {
                          result.error("ERROR", "Unknown error", null)
                      }

                  }
              }
      }
    } else if(call.method == "showOffers") {
        val data: HashMap<String,Any>? =  call.arguments as HashMap<String,Any>?
        val presentationStyle: Int = (data?.get("presentationStyle") as Int?) ?: 0
        val isTransparent: Boolean = (data?.get("isTransparent") as Boolean?) ?: true
        val topMargin: Int =  (data?.get("topMargin") as Int?) ?: 0
        val rightMargin: Int = (data?.get("rightMargin") as Int?) ?: 0
        val bottomMargin: Int = (data?.get("bottomMargin") as Int?) ?: 0
        val leftMargin: Int = (data?.get("leftMargin") as Int?) ?: 0
        val style  = if (presentationStyle == 0) AdsPostXPresentationStyle.POPUP else AdsPostXPresentationStyle.FULLSCREEN

        AdsPostX.showOffers(
            style,
            isTransparent,
            margin = Margin(topMargin.toUInt(),bottomMargin.toUInt(),leftMargin.toUInt(),rightMargin.toUInt()),
            onShow = {
                println("On show")
                result.success("success")
            },
            onError = { it ->
                result.error("ERROR",it.message,null)
            },
            onDismiss = {
                println("Dismiss")
            })
    }else if(call.method == "setEnvironment") {
        val data: HashMap<String,Any> =  call.arguments as HashMap<String,Any>
        val environment: Int = (data["environment"] as Int?) ?: 0

        if(environment == 0) {
            AdsPostX.setEnvironment(AdsPostxEnvironment.LIVE)
            result.success("success")
        } else {
            AdsPostX.setEnvironment(AdsPostxEnvironment.TEST)
            result.success("success")
        }
    } else if(call.method == "setDebugLog") {
        val data: HashMap<String,Any> =  call.arguments as HashMap<String,Any>
        val isdebugLogEnabled: Boolean = (data["debugLog"] as Boolean?) ?: false

        AdsPostX.setDebugLog(isdebugLogEnabled)
        result.success("success")
    }else if(call.method == "setTimeOut") {
        val data: HashMap<String,Any> =  call.arguments as HashMap<String,Any>
        val timeOut: Double = (data["timeout"] as Double?) ?: 10.0

        AdsPostX.setTimeOut(timeOut)
        result.success("success")
    }
    else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

}
