//
//  DemoModel.h
//  JMSystemNotifications
//
//  Created by jerome morissard on 04/04/2015.
//  Copyright (c) 2015 Jérôme Morissard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DemoModel : NSObject

@property (strong, nonatomic) NSString *notificationName;
@property (strong, nonatomic) NSString *minOS;
@property (assign, nonatomic) BOOL available;

+ (DemoModel *)modelWithName:(NSString *)name available:(BOOL)available;

@end
