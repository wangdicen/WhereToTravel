//
//  AboutViewController.m
//  wheretotravel
//
//  Created by 汪迪岑 on 16/9/28.
//  Copyright © 2016年 汪迪岑. All rights reserved.
//

#import "AboutViewController.h"
#import "Header.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGB(61, 78, 97, 0.9);
    
    UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 15, 50, 50)];
    [self.view addSubview:closeBtn];
    closeBtn.center = CGPointMake(SCREEN_WEIGHT - 25, 20+15);
    [closeBtn setImage:[UIImage imageNamed:@"btn_close.png"] forState:UIControlStateNormal];
    [closeBtn setImage:[UIImage imageNamed:@"btn_close.png"] forState:UIControlStateHighlighted];
    [closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
   
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WEIGHT, SCREEN_HEIGHT)];
    [self.view addSubview:label];
    
    label.text = @"开发者微博：大布溜W\n\n图片处理：大布溜w\n程序开发：大布溜w\n\n部分图片取至网络\n\"了解更多\"均转跳至百度百科";
    label.font = [UIFont fontWithName:@"HYChenMeiZiJ" size:20.0];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 12;
    
}

- (void)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
