//
//  ViewController.m
//  站一下
//
//  Created by will on 14-11-12.
//  Copyright (c) 2014年 veepoo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UILocalNotification *notification;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (notification == nil) {
        for (int i = 9; i <= 18; i++) {
            notification = [[UILocalNotification alloc]init];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            
            [formatter setDateFormat:@"HH:mm:ss"];
            NSString *nTime = [NSString stringWithFormat:@"%02d:30:00",i];
            //触发通知的时间
            
            NSDate *now = [formatter dateFromString:nTime];
            
            notification.fireDate = now;
            
            //时区
            
            notification.timeZone = [NSTimeZone defaultTimeZone];
            
            //通知重复提示的单位，可以是天、周、月
            
            notification.repeatInterval = NSCalendarUnitDay;
            
            //通知内容
            
            notification.alertBody = @"站一下";
            
            //通知被触发时播放的声音
            
            notification.soundName = UILocalNotificationDefaultSoundName;
            
            //执行通知注册
            
            [[UIApplication sharedApplication] scheduleLocalNotification:notification];

        }
    }
    NSArray *activeNotifications = [[UIApplication sharedApplication] scheduledLocalNotifications];
    NSLog(@"%@",activeNotifications);
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
