# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'SejongsAirplane' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SejongsAirplane
  
  # pod NVActivityIndicatorView
  pod 'NVActivityIndicatorView'
  
  # Pod Firebase
  pod 'Firebase/Analytics'
  pod 'Firebase/Firestore'
  
  # Firebase Storage
  pod 'Firebase/Storage'
  
  pod 'Kingfisher'
  
  pod 'iCarousel'
  
  pod 'CTPanoramaView', '~> 1.3'
  
  # pod CropViewController
  pod 'CropViewController'
  
  target 'SejongsAirplaneTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'SejongsAirplaneUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
    end
  end
end
