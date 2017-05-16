Pod::Spec.new do |s|
s.name         = "runloop"
s.version      = "0.0.1"
s.summary      = "use runloop to optimize performance "
s.homepage     = "https://github.com/summer87279149/XYrunloop"
s.license      = "MIT"
s.author             = { "Summer" => "1033948449@qq.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/summer87279149/XYrunloop.git", :tag => "0.0.1" }
s.source_files  = "runloop", "runloop/**.{h,m}"
s.framework = 'UIKit'
end
