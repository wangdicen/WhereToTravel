//
//  ThreeCoupleViewController.m
//  wheretotravel2
//
//  Created by 汪迪岑 on 2017/10/2.
//  Copyright © 2017年 汪迪岑. All rights reserved.
//

#import "ThreeCoupleViewController.h"

@interface ThreeCoupleViewController ()<UIScrollViewDelegate>
{
    UIView  *_backgroundView;
    MyTitleView *_titlview;
    UIImageView *_backgroundImageView;
    UIScrollView  *_scrollView;
}
@end

@implementation ThreeCoupleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    
    [self addUI];
    
}


-(void)addUI{
    if (_backgroundView == nil) {
        _backgroundView = [UIViewModel addViewWithString:@"UIView"
                                               InPostion:[[PositionViewModel sharePositionViewModel].threeCoupleViewDictionary objectForKey:UI_THREECOUPLEVIEW_BACKGROUND]
                                                OnFather:self.view];
    }
    [_backgroundView applyRoundCorners:UIRectCornerAllCorners radius:10];
    _backgroundView.backgroundColor = [UIColor whiteColor];
    
    
    if (_backgroundImageView == nil) {
        _backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _backgroundView.frame.size.width, _backgroundView.frame.size.height)];
    }
    [_backgroundImageView applyRoundCorners:UIRectCornerAllCorners radius:10.0];
    [_backgroundView addSubview:_backgroundImageView];
    [_backgroundImageView setImage:IMAGE(@"1.jpg")];
    
    
    if (_scrollView == nil) {
        _scrollView = [UIViewModel addViewWithFrameWithString:@"UIScrollView"
                                                  InPostion:[[PositionViewModel sharePositionViewModel].threeCoupleViewDictionary objectForKey:UI_THREECOUPLEVIEW_SCROLLVIEW]
                                                   OnFather:_backgroundView];
    }
    _scrollView.contentSize  = CGSizeMake(_scrollView.frame.size.width, _scrollView.frame.size.height * 1.5);
    //kvo
    [_scrollView addObserver:self
                  forKeyPath:@"contentOffset"
                     options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld
                     context:nil];
    
    
    if(_titlview == nil) {
        _titlview = [UIViewModel addViewWithFrameWithString:@"MyTitleView"
                                         InPostion:[[PositionViewModel sharePositionViewModel].threeCoupleViewDictionary objectForKey:UI_THREECOUPLEVIEW_TITLEVIEW]
                                          OnFather:_backgroundView];
    }
    [_titlview.leftBtn setImage:IMAGE(@"0002_file") forState:UIControlStateNormal];
    [_titlview.rightBtn setImage:IMAGE(@"0005_bookmark-open.png") forState:UIControlStateNormal];
    
}


-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                      context:(void *)context
{
    
    [UIViewModel showOrHideNavWithTitleView:_titlview
                                 scrollView:_scrollView
                             contentSizeOff:[change[NSKeyValueChangeNewKey] CGPointValue].y];
}


-(void)dealloc
{
     [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
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
