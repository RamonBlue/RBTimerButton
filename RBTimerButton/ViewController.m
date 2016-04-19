//
//  ViewController.m
//  RBTimerButton
//
//  Created by Ran on 16/4/18.
//  Copyright © 2016年 Justice. All rights reserved.
//

#import "ViewController.h"
#import "RBPhoneRegisterViewController.h"
#import "RBMailRegisterViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)phoneRegister:(id)sender
{
    [self.navigationController pushViewController:[RBPhoneRegisterViewController new] animated:YES];
}

- (IBAction)mailRegister:(id)sender
{
    [self.navigationController pushViewController:[RBMailRegisterViewController new] animated:YES];
}

@end
