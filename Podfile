platform :ios, '10.0'
use_frameworks!

target 'Emersy' do
  pod 'SwiftyJSON'
  pod 'Alamofire', '~> 4.0'
  pod 'SVProgressHUD'
end

target 'EmersyTests' do

end

target 'EmersyUITests' do

end

target 'Emersy WatchKit App' do

end

target 'Emersy WatchKit Extension' do

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
