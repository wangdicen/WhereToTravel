//
//  MenuViewController.m
//  wheretotravel
//
//  Created by 汪迪岑 on 16/9/16.
//  Copyright © 2016年 汪迪岑. All rights reserved.
//

#import "MenuViewController.h"
#import "Header.h"
#import "KuangView.h"
#import "ListViewController.h"

@interface MenuViewController ()<UIScrollViewDelegate>
{
     UIScrollView *_scroll;
     UIPageControl *_pageControl;

}
@end


@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGB(61, 78, 97, 0.7);
   
    //----
    _scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WEIGHT, SCREEN_HEIGHT)];
    _scroll.backgroundColor = [UIColor clearColor];
    _scroll.delegate = self;
    _scroll.contentSize = CGSizeMake(SCREEN_WEIGHT * 5, SCREEN_HEIGHT);
    [self.view addSubview:_scroll];
    _scroll.pagingEnabled = YES;
   
    [self initWithImageName:@"shanghai1.jpg" text1:nil text2:nil cityOrAuthorName:@"城市旅游" tag:20001];
    [self initWithImageName:@"lijiang1.jpg" text1:nil text2:nil cityOrAuthorName:@"著名景区" tag:20002];
    [self initWithImageName:@"seda1.jpg" text1:nil text2:nil cityOrAuthorName:@"小众景点" tag:20003];
    [self initWithImageName:@"riben1.jpg" text1:nil text2:nil cityOrAuthorName:@"亚洲" tag:20004];
    [self initWithImageName:@"meiguo1.jpg" text1:nil text2:nil cityOrAuthorName:@"美欧澳非" tag:20005];

    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 130, 0)];
    _pageControl.center = CGPointMake(SCREEN_WEIGHT / 2.0 ,SCREEN_HEIGHT *1.0/2.0 + SCREEN_HEIGHT*2.0/3.0/2.0 + 5 + 10);
    _pageControl.numberOfPages = 5;
    _pageControl.currentPage = 0;
    [self.view addSubview:_pageControl];
    
    UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 15, 50, 50)];
    [self.view addSubview:closeBtn];
    closeBtn.center = CGPointMake(SCREEN_WEIGHT - 25, 20+15);
    [closeBtn setImage:[UIImage imageNamed:@"btn_close.png"] forState:UIControlStateNormal];
    [closeBtn setImage:[UIImage imageNamed:@"btn_close.png"] forState:UIControlStateHighlighted];
    [closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goToListViewController:) name:@"goToListViewController" object:nil];
    

}

- (void)goToListViewController:(NSNotification *)noti
{
    NSNumber *TAG = [noti.userInfo objectForKey:@"tag"];
    ListViewController *lvc = [[ListViewController alloc] initWithKey:[noti.userInfo objectForKey:@"title"]];
    lvc.tagggg = TAG.integerValue;
    lvc.title = [noti.userInfo objectForKey:@"title"];
    //*******IMPORTANT,,,去掉present 后留下的黑色背景，
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        
        lvc.modalPresentationStyle=UIModalPresentationOverCurrentContext;
        
    }else{
        
        self.modalPresentationStyle=UIModalPresentationCurrentContext;
        
    }
    [self presentViewController:lvc animated:YES completion:nil];
    
}

- (void)initWithImageName:(NSString *)imageName  text1:(NSString *)text1 text2:(NSString *)text2 cityOrAuthorName:(NSString *)text3 tag:(int)tag
{
    KuangView *kuang = [[KuangView alloc] initWithImageName:imageName text1:text1 text2:text2 cityOrAuthorName:text3 frame:CGRectMake(0, 0, SCREEN_WEIGHT*2.0/3.0, SCREEN_HEIGHT*2.0/3.0)];
    kuang.tag = tag;
    kuang.center = CGPointMake(SCREEN_WEIGHT / 2.0 + SCREEN_WEIGHT * (tag -20000 -1), SCREEN_HEIGHT *1.0/2.0);
    [_scroll addSubview:kuang];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    _pageControl.currentPage = page;
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
