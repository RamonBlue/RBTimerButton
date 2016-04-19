//
//  RBPhoneRegisterViewController.m
//  RBTimerButton
//
//  Created by Ran on 16/4/18.
//  Copyright © 2016年 Justice. All rights reserved.
//

#import "RBPhoneRegisterViewController.h"
#import "RBTimerButton.h"

@implementation RBPhoneRegisterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    RBTimerButton *timerButton = [[RBTimerButton alloc] initWithFrame:CGRectMake(20, 100, 120, 40)];
    timerButton.maxTimeInterval = 5;
    timerButton.layer.cornerRadius = 4;
    timerButton.clipsToBounds = YES;
    [self.view addSubview:timerButton];
    
    [timerButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    if ([timerButton hasReachedMaxTimeInterval])
    {
        timerButton.settingBlock(timerButton.maxTimeInterval + 1);
    }
    else
    {
        [timerButton startTimer];
    }
}

- (void)buttonClicked: (RBTimerButton *)button
{
    [button startTimer];
    NSLog(@"phone register button click");
}

@end
