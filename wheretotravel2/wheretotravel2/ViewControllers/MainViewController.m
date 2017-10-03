//
//  MainViewController.m
//  wheretotravel2
//
//  Created by 汪迪岑 on 2017/10/1.
//  Copyright © 2017年 汪迪岑. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
{
    UIScrollView *_scroll;
    
    NSMutableArray *_threeCoupleViewArray;
    
    __strong ThreeCoupleViewController *_tcvc;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addUI];

}


- (void)addUI{
    
    if (_scroll == nil) {
        _scroll = [UIViewModel addViewWithString:@"UIScrollView"
                                       InPostion:[[PositionViewModel sharePositionViewModel].mainViewDictionary objectForKey:UI_MAIN_SCROLL]
                                        OnFather:self.view];
    }
    _scroll.backgroundColor = [UIColor clearColor];
    _scroll.pagingEnabled = YES;
    _scroll.showsHorizontalScrollIndicator = NO;
    
    NSArray *cities = [MyCities shareMyCities].cities;
    _scroll.contentSize = CGSizeMake(SCREEN_WEIGHT * [cities count], SCREEN_HEIGHT);
    
    //主界面n个并列的threecoupleview，排列标记为喜爱的城市。
    if (_threeCoupleViewArray == nil) {
        _threeCoupleViewArray = [[NSMutableArray alloc] init];
    }
    _threeCoupleViewArray = nil;
    
    for (int i = 0; i < [cities count]; i++) {
        _tcvc = [[ThreeCoupleViewController alloc] init];
        [_scroll addSubview:_tcvc.view];
        _tcvc.cityName = [cities objectAtIndex:i];
        [UIViewModel displayOnController:self ContentController:_tcvc withFrame:CGRectMake(SCREEN_WEIGHT * i, 0, SCREEN_WEIGHT, SCREEN_HEIGHT)];
    }
}



- (void)dealloc
{
    
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
