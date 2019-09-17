Pod::Spec.new do |s|

# Basic information about the pod.
s.platform = :ios
s.ios.deployment_target = '12.0'
s.name = "RWPickFlavor"
s.summary = "RWPickFlavor lets a user select an ice cream flavor."
s.requires_arc = true

# A Podspec is essentially a snapshot in time of your CocoaPod as denoted by a version number. When you update a pod, you’ll also need to update the Podspec’s version. All CocoaPods are highly encouraged to follow Semantic Versioning. If you’re not familiar with Semantic Versioning, see How to Use CocoaPods with Swift for more information.
s.version = "0.1.0"

# All pods must specify a license. If you don’t, CocoaPods will present a warning when you try to install the pod, and you won’t be able to upload it to CocoaPods trunk — the master specs repo.
s.license = { :type => "MIT", :file => "LICENSE" }

# pod author
s.author = { "Jose Lopez" => "jjlz.cocoa@gmail.com" }

# 5 - URL for your pod’s homepage
s.homepage = "https://github.com/JJLZ/RWPickFlavor"

# 6 - Git URL from "Quick Setup"
s.source = { :git => "https://github.com/JJLZ/RWPickFlavor.git",
             :tag => "#{s.version}" }

# Here, you specify the framework and any pod dependencies. CocoaPods will make sure that these dependencies are installed and usable by your app.
s.framework = "UIKit"
s.dependency 'Alamofire', '~> 4.7'
s.dependency 'MBProgressHUD', '~> 1.1.0'

# Not all files in your repository will be installed when someone installs your pod.
# Here, you specify the public source files based on file extensions; in this case, you specify .swift as the extension.
s.source_files = "RWPickFlavor/**/*.{swift}"

# Here, you specify the resources based on their file extensions.
s.resources = "RWPickFlavor/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"

# Finally, specify 4.2 as the version of Swift used in the pod.
s.swift_version = "4.2"

end
