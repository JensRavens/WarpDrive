Pod::Spec.new do |s|
  s.name = 'WarpDrive'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'Timing and threading helpers for Interstellar'
  s.homepage = 'https://github.com/JensRavens/WarpDrive'
  s.social_media_url = 'http://twitter.com/JensRavens'
  s.authors = { 'Jens Ravens' => 'jens@nerdgeschoss.de' }
  s.source = { :git => 'https://github.com/JensRavens/WarpDrive.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'

  s.source_files = 'WarpDrive/*.swift'

  s.dependency 'Interstellar', '1.2'

  s.requires_arc = true
end
