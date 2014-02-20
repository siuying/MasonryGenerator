Pod::Spec.new do |s|
  s.name         = "MasonryGenerator"
  s.version      = "0.1.0"
  s.summary      = "A Mansory extension to generate native NSLayoutConstraint code from Mansory code."

  s.description  = <<-DESC
                   A Mansory extension to generate native NSLayoutConstraint code from Mansory code.
                   DESC

  s.homepage     = "https://github.com/siuying/MasonryGenerator"
  s.license      = { :type => 'MIT', :file => 'LICENSE.txt' }
  s.author             = { "Francis Chong" => "francis@ignition.hk" }
  s.social_media_url = "http://twitter.com/siuying"

  s.ios.frameworks = 'Foundation', 'UIKit'
  s.osx.frameworks = 'Foundation', 'AppKit'

  s.ios.deployment_target = '6.0' # minimum SDK with autolayout
  s.osx.deployment_target = '10.7' # minimum SDK with autolayout

  s.source       = { :git => "https://github.com/siuying/MasonryGenerator.git", :tag => s.version.to_s }

  s.source_files  = 'MasonryGenerator/Classes/**/*.{h,m}'

  s.requires_arc = true

  s.dependency 'Masonry', '>= 0.4.0'
  s.dependency 'JRSwizzle', '~> 1.0'

end
