Pod::Spec.new do |s|
  s.name             	= "NSDate+Helpers"
  s.version          	= "0.1.2"
  s.summary          	= "A category on NSDate that extends NSDate class functionality."
  s.description      	= "NSDate class's cetogory that adds useful methods for work with date and time."
  s.homepage         	= "https://github.com/Bogdan-Stasjuk/NSDate-Helpers"
  s.license      		= { :type => 'MIT', :file => 'LICENSE' }
  s.author           	= { "Bogdan Stasjuk" => "Bogdan.Stasjuk@gmail.com" }
  s.source           	= { :git => "https://github.com/Bogdan-Stasjuk/NSDate-Helpers.git", :tag => '0.1.2' }
  s.social_media_url 	= 'https://twitter.com/Bogdan_Stasjuk'
  s.platform     		= :ios, '6.0'
  s.requires_arc 	= true
  s.source_files 	= 'NSDate+Helpers/*.{h,m}'
  s.public_header_files   	= 'NSDate+Helpers/*.h'
end
