#
# Be sure to run `pod lib lint MJModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MJModule'
  s.version          = '0.1.0'
  s.swift_version    = '3.2'
  s.summary          = 'This is a module management center in swift'

  s.homepage         = 'https://github.com/Musjoy/MJModule'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Raymond' => 'Raymond.huang@musjoy.com' }
  s.source           = { :git => 'https://github.com/Musjoy/MJModule.git', :tag => "v-#{s.version}" }

  s.ios.deployment_target = '8.0'

  s.source_files = 'MJModule/*','Public/*'
  s.user_target_xcconfig = {
    'OTHER_SWIFT_FLAGS' => '-D MODULE'
  }

  s.prepare_command = <<-CMD
    if [ ! -d "Public/" ];then
    mkdir Public
    cd Public
    ln -s ../../Public/*.swift .
    fi
CMD

  s.script_phase = { :name => 'Link', :script => 'evn > test.txt' }

end
