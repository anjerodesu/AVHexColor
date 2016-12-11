Pod::Spec.new do |s|
  s.name                  = 'AVHexColor'
  s.version               = '3.0.0'
  s.summary               = 'AVHexColor was inspired by the lack of hexadecimal colour integration of iOS.'
  s.description           = 'AVHexColor was inspired by the lack of hexadecimal colour integration of iOS. AVHexColor is a class with hex support for both NSColor and UIColor. Supports both prefixed with "#" and without for string-based hex colours.'
  s.author                = {'Angelo Villegas' => 'admin@angelovillegas.com'}
	s.social_media_url      = 'https://twitter.com/anjerodesu'
  s.homepage              = 'https://github.com/anjerodesu/AVHexColor'
  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.8'
  s.license               = 'MIT'
  s.source                = { :git => 'https://github.com/anjerodesu/AVHexColor.git', :tag => '3.0.0' }
  s.source_files          = 'AVHexColor.{h,m}'
  s.requires_arc          = false
end
