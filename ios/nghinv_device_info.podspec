#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint n_device_info.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'nghinv_device_info'
  s.version          = '0.0.1'
  s.summary          = 'A Flutter plugin project for get device info.'
  s.description      = <<-DESC
A new Flutter plugin project for get device info.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'NghiNV' => 'nguyennghidt6@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
