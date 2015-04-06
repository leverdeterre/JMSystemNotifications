//
//  NSError+JMSystemNotification.m
//  JMSystemNotifications
//
//  Created by jerome morissard on 06/04/2015.
//  Copyright (c) 2015 Jérôme Morissard. All rights reserved.
//

#import "NSError+JMSystemNotification.h"

NSString * const JMNotificationErrorDomain = @"JMSystemNotification";

@implementation NSError (JMSystemNotification)

+ (NSError *)jm_errorWithNotificationError:(JMNotificationError)errorEnum
{
    return [NSError errorWithDomain:JMNotificationErrorDomain code:errorEnum userInfo:nil];
}

@end
