//
//  DemoModel.m
//  JMSystemNotifications
//
//  Created by jerome morissard on 04/04/2015.
//  Copyright (c) 2015 Jérôme Morissard. All rights reserved.
//

#import "DemoModel.h"

@implementation DemoModel

+ (DemoModel *)modelWithName:(NSString *)name available:(BOOL)available
{
    DemoModel *m = [DemoModel new];
    m.notificationName = name;
    m.available = available;
    return m;
}

@end
