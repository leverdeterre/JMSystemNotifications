Pod::Spec.new do |s|

  s.name         = "JMSystemNotifications"
  s.version      = "0.0.1"
  s.summary      = "JMSystemNotifications is an Objective-C library for easily register OS System notifications"
  s.requires_arc = true

  s.description  = <<-DESC
				  JMSystemNotifications is an Objective-C library for easily register OS System notifications. 
				  Do you all the possible notifications send by the system.
				  * Here, the first 114 Notifications :)
                  DESC

  s.homepage     = "https://github.com/leverdeterre/JMSystemNotifications"

  s.license      = 'MIT'
  s.author       = { "Jérôme Morissard" => "morissardj@gmail.com" }
  s.platform     = :ios, '6.0'
  s.source       = { :git => "https://github.com/leverdeterre/JMSystemNotifications.git", :tag => "0.0.1" }
  s.source_files = 'Classes', 'JMSystemNotifications/JMSystemNotifications/*.{h,m}'
  s.public_header_files = 'JMSystemNotifications/JMSystemNotifications/*.h'
  s.framework           = 'UIKit'
end
