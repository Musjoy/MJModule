#
# Be sure to run `pod lib lint MJModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MJModule'
  s.version          = '0.1.3'
  s.swift_version    = '3.2'
  s.summary          = 'This is a module management center in swift'

  s.homepage         = 'https://github.com/Musjoy/MJModule'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Raymond' => 'Raymond.huang@musjoy.com' }
  s.source           = { :git => 'https://github.com/Musjoy/MJModule.git', :tag => "v-#{s.version}" }

  s.ios.deployment_target = '8.0'

  s.source_files = 'MJModule/Classes/*.swift'
  s.user_target_xcconfig = {
    'OTHER_SWIFT_FLAGS' => '-D MODULE'
  }

  s.prepare_command = <<-CMD
#    cd MJModule
#    if [ -d "Public/" ];then
#        rm -Rf Public
#    fi
#    mkdir Public
#    cd Public
#    echo $POD_FILE_PATH > txt.txt
#    if [ $POD_FILE_PATH ];then
#        ln -s $POD_FILE_PATH/Public/*.swift .
#    fi
CMD

  s.script_phase = { :name => 'Link', :script => 'env > test.txt; exit 0;' }

end
