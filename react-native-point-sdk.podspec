Pod::Spec.new do |s|
  s.name         = "react-native-point-sdk"
  s.version      = "0.0.4"
  s.summary      = "React Native library for Point SDK"
  s.homepage     = "https://github.com/agencyenterprise/point-sdk-rn"
  s.license      = "MIT"
  s.authors      = "Anny Figueira"

  s.platform = :ios
  s.ios.deployment_target = "13.0"
  s.source       = { :git =>  "https://github.com/agencyenterprise/point-sdk-rn.git", :tag => "0.0.4" }

  s.source_files = "ios/**/*.{h,m,mm,swift}"

  s.dependency "React"
  s.dependency "PointSDK"
end
