//
//  NSError+JMSystemNotification.h
//  JMSystemNotifications
//
//  Created by jerome morissard on 06/04/2015.
//  Copyright (c) 2015 Jérôme Morissard. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const JMNotificationErrorDomain;

typedef NS_ENUM(NSUInteger, JMNotificationError) {
    JMNotificationAlreadyObservedError = 1,
    JMNotificationNotAvailableError
};

@interface NSError (JMSystemNotification)

+ (NSError *)jm_errorWithNotificationError:(JMNotificationError)errorEnum;

@end
