#import "AdspostxFlutterPlugin.h"
#if __has_include(<adspostx_flutter/adspostx_flutter-Swift.h>)
#import <adspostx_flutter/adspostx_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "adspostx_flutter-Swift.h"
#endif

@implementation AdspostxFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAdspostxFlutterPlugin registerWithRegistrar:registrar];
}
@end
