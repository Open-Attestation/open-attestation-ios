#
# Be sure to run `pod lib lint OpenAttestationIOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OpenAttestationIOS'
  s.version          = '0.1.0'
  s.summary          = 'An iOS wrapper library for OpenAttestation'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This library allows iOS app developers to build apps that verify and view OpenAttestation documents
                       DESC

  s.homepage         = 'https://www.openattestation.com/'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tan Cher Shen' => 'tan_cher_shen@tech.gov.sg' }
  s.source           = { :git => 'https://github.com/Open-Attestation/open-attestation-ios.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'
  s.swift_versions = '4.0'

  s.source_files = 'OpenAttestationIOS/Classes/**/*'
  
  # s.resource_bundles = {
  #   'OpenAttestationIOS' => ['OpenAttestationIOS/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
