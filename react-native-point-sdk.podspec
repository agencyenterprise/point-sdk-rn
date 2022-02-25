require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-point-sdk"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platform = :ios
  s.ios.deployment_target = "13.0"
  s.source       = { :git =>  "https://github.com/agencyenterprise/point-sdk-rn.git", :tag => "0.0.2" }

  s.source_files = "ios/**/*.{h,m,mm,swift}"

  s.dependency "React"
  s.dependency "PointSDK"
end
