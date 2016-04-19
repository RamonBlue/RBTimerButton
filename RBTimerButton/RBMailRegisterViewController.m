//
//  RBMailRegisterViewController.m
//  RBTimerButton
//
//  Created by Ran on 16/4/18.
//  Copyright © 2016年 Justice. All rights reserved.
//

#import "RBMailRegisterViewController.h"
#import "RBTimerButton.h"

@implementation RBMailRegisterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    RBTimerButton *timerButton = [[RBTimerButton alloc] initWithFrame:CGRectMake(20, 100, 200, 40)];
    timerButton.layer.cornerRadius = 4;
    timerButton.clipsToBounds = YES;
    [self.view addSubview:timerButton];
    
    timerButton.titleLabel.font = [UIFont systemFontOfSize:17];
    timerButton.timerKey = RB_DEFAULT_MAIL_TIMER_KEY;
    timerButton.maxTimeInterval = 20;
    timerButton.displayLink.frameInterval = 30;
    __weak typeof(timerButton) weakButton = timerButton;
    timerButton.settingBlock = ^(NSTimeInterval time){
        if (time < weakButton.maxTimeInterval)
        {
            weakButton.enabled = NO;
            [weakButton setTitle:[NSString stringWithFormat:@"%.0f秒后重新发送邮件", weakButton.maxTimeInterval - time] forState:UIControlStateDisabled];
            [weakButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateDisabled];
            weakButton.backgroundColor = [UIColor whiteColor];
        }
        else
        {
            weakButton.enabled = YES;
            [weakButton setTitle:@"发送激活邮件" forState:UIControlStateNormal];
            [weakButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            weakButton.backgroundColor = [UIColor orangeColor];
        }
    };
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
    NSLog(@"mail register button click");
}

@end
