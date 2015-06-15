Pod::Spec.new do |s|

  s.name         = "JMSystemNotifications"
  s.version      = "0.0.2"
  s.summary      = "JMSystemNotifications is an Objective-C library for easily register/unregister easy to system notifications using block API."
  s.requires_arc = true

  s.description  = <<-DESC
				  JMSystemNotifications is an Objective-C library for easily register/unregister easy to system notifications using block API.
				  Do you all the possible notifications send by the system.
				  * Here, the first 114 Notifications 
                  DESC

  s.homepage     = "https://github.com/leverdeterre/JMSystemNotifications"

  s.license      = 'MIT'
  s.author       = { "Jérôme Morissard" => "morissardj@gmail.com" }
  s.platform     = :ios, '6.0'
  s.source       = { :git => "https://github.com/leverdeterre/JMSystemNotifications.git", :tag => "0.0.2" }
  s.source_files = 'Classes', 'JMSystemNotifications/JMSystemNotifications/*.{h,m}'
  s.public_header_files = 'JMSystemNotifications/JMSystemNotifications/*.h'
  s.framework           = 'UIKit'
end
