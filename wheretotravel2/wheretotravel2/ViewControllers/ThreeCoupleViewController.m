//
//  ThreeCoupleViewController.m
//  wheretotravel2
//
//  Created by 汪迪岑 on 2017/10/2.
//  Copyright © 2017年 汪迪岑. All rights reserved.
//

#import "ThreeCoupleViewController.h"

@interface ThreeCoupleViewController ()
{
    UIView  *_backgroundView;
}
@end

@implementation ThreeCoupleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    
    if (_backgroundView == nil) {
        _backgroundView = [UIViewModel addViewWithString:@"UIView"
                                               InPostion:[[PositionViewModel sharePositionViewModel].threeCoupleViewDictionary objectForKey:UI_THREECOUPLEVIEW_BACKGROUND]
                                                OnFather:self.view];
    }
    [_backgroundView applyRoundCorners:UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomLeft|UIRectCornerBottomRight radius:10];
     _backgroundView.backgroundColor = [UIColor whiteColor];
    
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
