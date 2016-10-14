#
# Be sure to run `pod lib lint luccasim2016.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'luccasim2016'
  s.version          = '0.1.0'
  s.summary          = 'Its a prototype.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Projet pour la piscine D08 swift a 42.
                       DESC

  s.homepage         = 'https://github.com/<GITHUB_USERNAME>/luccasim2016'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Luc' => 'luccasim@student.42.fr' }
  s.source           = { :git => 'https://github.com/<GITHUB_USERNAME>/luccasim2016.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'luccasim2016/Classes/**/*'
  
  # s.resource_bundles = {
  #   'luccasim2016' => ['luccasim2016/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit', 'CoreData'
  # s.dependency 'AFNetworking', '~> 2.3'
end
