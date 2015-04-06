##JMSystemNotifications

JMSystemNotifications is an Objective-C library for easily register OS System notifications. 
Do you all the possible notifications send by the system.
Here, the first 114 Notifications :)

![Image](./screenshots/merged_demos.png)

###Registering System Notifications 

```objc

	- (BOOL)jm_observeNotification:(JMSystemNotification)notification usingBlock:(JMNotificationBlock)block;
	- (BOOL)jm_observeNotification:(JMSystemNotification)notification usingBlock:(JMNotificationBlock)block error:(NSError **)error;
```

With error catching, because some notifications are iOS version dependant
```objc

	BOOL addObserverSucessfully = [self jm_observeNotification:JMUserDefaultsDidChangeNotification usingBlock:^(NSNotification *notif) {
        NSLog(@"JMUserDefaultsDidChangeNotification");
    }];
	
    NSError *error;
	[self jm_observeNotification:JMUserDefaultsDidChangeNotification usingBlock:^(NSNotification *notif) {
        NSLog(@"JMUserDefaultsDidChangeNotification");
    } error:&error];
```

###Unregistering System Notifications 

```objc

	- (void)jm_removeObservedNotification:(JMSystemNotification)notification;
	- (void)jm_removeObservedNotifications;
```


### Todo
* AVFoundation
* CloudKit
* ExternalAccessory
* GameKit
* GameController
* HealthKit
* MediaPlayer
* NetworkExtension
* NewsstandKit
* CoreBluetooth?
* CoreMedia?
* CoreFoundation?
