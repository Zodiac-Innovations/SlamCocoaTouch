Pod::Spec.new do |s|
s.platform = :ios
s.ios.deployment_target = '8.0'
s.name = 'SlamCocoaTouch'
s.summary = 'Swift Closure based open source UI Framework for iOS Development.'
s.requires_arc = true
s.version = '0.1.0'
s.license  = 'MIT'
s.author = { 'Steve Sheets' => 'steve.sheets@zodiacinnovations.com' }
s.homepage = 'https://github.com/Zodiac-Innovations/SlamCocoaTouch'
s.source = { :git => 'https://github.com/Zodiac-Innovations/SlamCocoaTouch.git', :tag => "#{s.version}" }
s.framework = 'UIKit'
s.source_files = 'SlamCocoaTouch/**/*.{swift,h}'
end

