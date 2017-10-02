//
//  ViewController.m
//  wheretotravel2
//
//  Created by 汪迪岑 on 2017/10/1.
//  Copyright © 2017年 汪迪岑. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myBackgroundColor = [UIColor flatLimeColor];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = _myBackgroundColor;
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
