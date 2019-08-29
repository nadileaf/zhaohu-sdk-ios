# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

workspace 'zhaohu-sdk-ios'


target 'zhaohu-sdk-ios' do
  project 'zhaohu-sdk-ios.xcodeproj'
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'MaterialComponents/Buttons'
  # Pods for zhaohu-sdk-ios

  target 'zhaohu-sdk-iosTests' do
    inherit! :search_paths
    # Pods for testing
  end

end


target 'example' do
  project 'example/example.xcodeproj'
  use_frameworks!
  pod 'zhaohu-sdk-ios', :path => './'
end


target 'zhaohu-sdk-iosPackageDescription' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for zhaohu-sdk-iosPackageDescription

end
