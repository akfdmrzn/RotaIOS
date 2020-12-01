#
# Be sure to run `pod lib lint OtiNetwork.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'OtiNetwork'
    s.version          = '0.9.7'
    s.summary          = 'OtiNetworking Manager includes configuration private'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = 'This library provides networking process of our project'
    s.swift_version = '4.0'
    
    s.homepage         = 'https://github.com/akfdmrzn/OtiNetwork'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'akfdmrzn' => 'maddemirezen@gmail.com' }
    s.source           = { :git => 'https://github.com/akfdmrzn/OtiNetwork.git'}
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
    
    s.ios.deployment_target = '9.0'
    
    s.source_files = 'OtiNetwork/**/*'
    
    # s.resource_bundles = {
    #   'OtiNetwork' => ['OtiNetwork/Assets/*.png']
    # }
    
    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    s.dependency 'ObjectMapper'
    s.dependency 'Alamofire', '~> 4.7'
    s.dependency 'AlamofireObjectMapper'
end
