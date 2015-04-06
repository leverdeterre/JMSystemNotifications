//
//  JMTableViewCell.h
//  JMSystemNotifications
//
//  Created by jerome morissard on 04/04/2015.
//  Copyright (c) 2015 Jérôme Morissard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *notificationNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *notificationOSLabel;
@property (weak, nonatomic) IBOutlet UIView *circularView;
@property (weak, nonatomic) IBOutlet UIButton *testButton;

@end
