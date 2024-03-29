#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint adspostx_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'adspostx_flutter'
  s.version          = '0.0.1'
  s.summary          = 'AdsPostX offers a flutter plugin designed to help you integrate AdsPostX into your flutter mobile application within minutes and start generating more revenue and increasing sales.'
  s.description      = <<-DESC
AdsPostX offers a flutter plugin designed to help you integrate AdsPostX into your flutter mobile application within minutes and start generating more revenue and increasing sales.
                       DESC
  s.homepage         = 'https://www.adspostx.com/'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'adspostx' => 'help@adspostx.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency "AdsPostX", "~> 1.0.7"

  s.platform = :ios, '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
