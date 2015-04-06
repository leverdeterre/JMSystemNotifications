//
//  ViewController.m
//  JMSystemNotifications
//
//  Created by jerome morissard on 03/04/2015.
//  Copyright (c) 2015 Jérôme Morissard. All rights reserved.
//

#import "ViewController.h"
#import "DemoModel.h"

#import "NSObject+JMSystemNotification.h"
#import "JMTableViewCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *list;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    NSMutableArray *array = [NSMutableArray new];
    BOOL available;
    DemoModel *md;
    
    available = [self jm_observeNotification:JMAccessibilityGuidedAccessStatusDidChangeNotification usingBlock:^(NSNotification *notif) {
        NSLog(@"UIAccessibilityGuidedAccessStatusDidChangeNotification");
    }];
    md = [DemoModel modelWithName:@"UIAccessibilityGuidedAccessStatusDidChangeNotification" available:available];
    md.minOS = @"iOS6_0";
    [array addObject:md];
    
    
    available = [self jm_observeNotification:JMApplicationWillEnterForegroundNotification usingBlock:^(NSNotification *notif) {
        NSLog(@"UIApplicationWillEnterForegroundNotification");
    }];
    md = [DemoModel modelWithName:@"UIApplicationWillEnterForegroundNotification" available:available];
    md.minOS = @"";
    [array addObject:md];
    
    available = [self jm_observeNotification:JMTextStorageWillProcessEditingNotification usingBlock:^(NSNotification *notif) {
        NSLog(@"NSTextStorageWillProcessEditingNotification");
    }];
    md = [DemoModel modelWithName:@"NSTextStorageWillProcessEditingNotification" available:available];
    md.minOS = @"iOS7_0";
    [array addObject:md];
    
    available = [self jm_observeNotification:JMAccessibilityReduceMotionStatusDidChangeNotification usingBlock:^(NSNotification *notif) {
        NSLog(@"NSTextStorageWillProcessEditingNotification");
    }];
    md = [DemoModel modelWithName:@"UIAccessibilityReduceMotionStatusDidChangeNotification" available:available];
    md.minOS = @"iOS8_0";
    [array addObject:md];
    
    available = [self jm_observeNotification:JMExtensionHostWillEnterForegroundNotification usingBlock:^(NSNotification *notif) {
        NSLog(@"NSExtensionHostWillEnterForegroundNotification");
    }];
    md = [DemoModel modelWithName:@"NSExtensionHostWillEnterForegroundNotification" available:available];
    md.minOS = @"iOS8_2";
    [array addObject:md];
    
    available = [self jm_observeNotification:JMWillBecomeMultiThreadedNotification usingBlock:^(NSNotification *notif) {
        NSLog(@"NSWillBecomeMultiThreadedNotification");
    }];
    md = [DemoModel modelWithName:@"NSWillBecomeMultiThreadedNotification" available:available];
    md.minOS = @"";
    [array addObject:md];
    
    available = [self jm_observeNotification:JMDidBecomeSingleThreadedNotification usingBlock:^(NSNotification *notif) {
        NSLog(@"NSDidBecomeSingleThreadedNotification");
    }];
    md = [DemoModel modelWithName:@"NSDidBecomeSingleThreadedNotification" available:available];
    md.minOS = @"";
    [array addObject:md];
    
    available = [self jm_observeNotification:JMThreadWillExitNotification usingBlock:^(NSNotification *notif) {
        NSLog(@"NSThreadWillExitNotification");
    }];
    md = [DemoModel modelWithName:@"NSThreadWillExitNotification" available:available];
    md.minOS = @"";
    [array addObject:md];
    
    self.list = array;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DemoModel *md = [self.list objectAtIndex:indexPath.row];
    JMTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"JMTableViewCell"];
    cell.notificationNameLabel.text = md.notificationName;
    cell.notificationOSLabel.text = md.minOS;
    cell.notificationOSLabel.textColor = [UIColor blackColor];

    if (md.available) {
        cell.circularView.backgroundColor = [UIColor greenColor];

    } else {
        cell.circularView.backgroundColor = [UIColor redColor];
    }
    cell.circularView.layer.cornerRadius = 10.0f;
    
    cell.testButton.layer.cornerRadius = 5.0f;
    cell.testButton.layer.borderWidth = 1.0f;
    cell.testButton.layer.borderColor = [UIColor blueColor].CGColor;
    return cell;
}

- (void)dealloc
{
    [self jm_removeObservedNotifications];
}

@end
