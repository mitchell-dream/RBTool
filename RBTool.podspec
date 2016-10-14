Pod::Spec.new do |s|
  s.name         = "RBTool"
  s.version      = "1.0.0"          
  s.summary      = "RB 工具库"
  s.description  = "RB 的工具库"
  s.homepage     = "https://github.com/mcmengchen/RBTool.git"
  s.license      = "MIT"
  s.author       = { "mengchen" => "mengchen@roo.bo" }
  s.source       = { :git => "https://github.com/mcmengchen/RBTool.git",:tag => s.version.to_s}
  s.platform     = :ios, "7.0"
  s.requires_arc = true       
  s.source_files = 'RBTool/Classes/**/*.{h,m}'
  s.frameworks = 'UIKit', 'Foundation'
end