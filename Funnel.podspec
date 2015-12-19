#
# Be sure to run `pod lib lint Funnel.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Funnel"
  s.version          = "0.1.0"
  s.summary          = "A funnel chart written in Swift."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
                        Funnel displays a funnel chart based on an array of values, it
                        can be customized in different ways, you can change the height and width of the stem, the height of the lip, the color palette, spacing, etc... All dimensions are percentage-based to that it stretches nicely.
                       DESC

  s.homepage         = "https://github.com/ayudasystems/funnel"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Pierre-Yves Troel" => "pyt@pyttroll.com" }
  s.source           = { :git => "https://github.com/<GITHUB_USERNAME>/Funnel.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'Funnel' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
