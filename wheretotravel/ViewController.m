//
//  ViewController.m
//  wheretotravel
//
//  Created by 汪迪岑 on 16/9/15.
//  Copyright © 2016年 汪迪岑. All rights reserved.
//

#import "ViewController.h"
#import "Header.h"
#import "SDLoopProgressView.h"
#import "SettingViewController.h"
#import "mottoViewController.h"
#import "MenuViewController.h"
#import <Foundation/Foundation.h>
#import <Accelerate/Accelerate.h>
#import "JoyingMobiVideoAd.h"
#import "Chameleon.h"

@interface ViewController ()<UIScrollViewDelegate,UIWebViewDelegate>
{
    //主要动图
    UIImageView *_mainImageView;
    //背景图
    UIImageView *_backgroundImageView;
    //半透明背景图
    UIView *_backView1;
    UIView *_backView2;
    UIView *_backView3;
    UIView *_backView4;
    UIView *_backView5;
    
    SDLoopProgressView *_loop;
    UILabel *_kindOfPlace;
    UIPageControl *_pageControl;
    
    UIScrollView *_scroll;
    
    UIButton *_button;
    
    NSTimer *_timer;
    int _count;
    
    //Data
    NSMutableDictionary  *_data;
    NSMutableArray *_menu;

    //showText
    UILabel *_showText;
    UIButton *_detailButton;
    UIWebView *_webView;
    
    int _i;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor = [UIColor grayColor];
    _i = 1;
    //----
    _backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WEIGHT, SCREEN_HEIGHT)];
    [self.view addSubview:_backgroundImageView];
    srandom(time(NULL));
    int i2 = random()%9 + 1;
    _backgroundImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i2]];
    
    
    //----
    _mainImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WEIGHT * 1.2, SCREEN_HEIGHT)];
    [self.view addSubview:_mainImageView];
    _mainImageView.center = CGPointMake(self.view.center.x, self.view.center.y/2.0);
    _mainImageView.image = [UIImage imageNamed:@"0.png"];
    
    //----
    _loop = [[SDLoopProgressView alloc] init];
    _loop.frame = CGRectMake(0, 0, SCREEN_WEIGHT*5.0/4.0, SCREEN_WEIGHT*3.0/4.0);
    _loop.center = CGPointMake(_mainImageView.center.x, _mainImageView.center.y+50);;
    _loop.progress = 0.0;
    [self.view addSubview:_loop];
    

    
    //----
    _scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WEIGHT, SCREEN_HEIGHT)];
    _scroll.backgroundColor = [UIColor clearColor];
    _scroll.delegate = self;
    _scroll.contentSize = CGSizeMake(SCREEN_WEIGHT * 5, SCREEN_HEIGHT);
    [self.view addSubview:_scroll];
    _scroll.pagingEnabled = YES;
    
    _backView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WEIGHT, SCREEN_HEIGHT)];
    [_scroll addSubview:_backView1];
    _backView1.backgroundColor = RGB(61, 78, 97, 0.3);
    
    _backView2 = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WEIGHT, 0, SCREEN_WEIGHT, SCREEN_HEIGHT)];
    [_scroll  addSubview:_backView2];
    _backView2.backgroundColor = RGB(68, 160, 169, 0.3);
    
    _backView3 = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WEIGHT * 2, 0, SCREEN_WEIGHT, SCREEN_HEIGHT)];
    [_scroll  addSubview:_backView3];
    _backView3.backgroundColor = RGB(234, 153, 93, 0.3);
    
    _backView4 = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WEIGHT * 3, 0, SCREEN_WEIGHT, SCREEN_HEIGHT)];
    [_scroll  addSubview:_backView4];
    _backView4.backgroundColor = RGB(214, 114, 146, 0.3);
    
    _backView5 = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WEIGHT * 4, 0, SCREEN_WEIGHT, SCREEN_HEIGHT)];
    [_scroll  addSubview:_backView5];
    _backView5.backgroundColor = RGB(186, 161, 77, 0.3);
    

    
    [self addTitle:@"旅游城市" num:1];
    [self addTitle:@"著名景区" num:2];
    [self addTitle:@"小众景区" num:3];
    [self addTitle:@"亚洲" num:4];
    [self addTitle:@"欧美澳非" num:5];
    

    [self addlineWitnCenter:CGPointMake(_mainImageView.center.x, _loop.center.y + _loop.frame.size.height/7.0)];
    [self addlineWitnCenter:CGPointMake(_mainImageView.center.x, _kindOfPlace.center.y + _kindOfPlace.frame.size.height/2.0 + 5)];

    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 130, 0)];
    _pageControl.center = CGPointMake(_mainImageView.center.x, _kindOfPlace.center.y + _kindOfPlace.frame.size.height/2.0 + 5 + 10);
    _pageControl.numberOfPages = 5;
    _pageControl.currentPage = 0;
    [self.view addSubview:_pageControl];
    
    //---
    _button = [[UIButton alloc] init];
    _button.frame = CGRectMake(0, 0, 120, 40);
    _button.center = CGPointMake(_loop.center.x, _loop.center.y + _loop.frame.size.height/2.0 +40);
    [_button setTitle:@"开始随机" forState:UIControlStateNormal];
    [_button setTitle:@"开始随机" forState:UIControlStateHighlighted];
    _button.titleLabel.font = [UIFont fontWithName:@"HYChenMeiZiJ" size:20.0];
    [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    _button.layer.cornerRadius = 20;
    _button.backgroundColor = RGB(53, 205, 75, 1.0);
    [self.view addSubview:_button];
    
    
    [self initbtn:100001 centerPoint:CGPointMake(self.view.center.x, SCREEN_HEIGHT - 40) imageName:@"0007_date.png"];
    [self initbtn:100002 centerPoint:CGPointMake(20, 20 + 15) imageName:@"0002_file.png"];
    [self initbtn:100003 centerPoint:CGPointMake(SCREEN_WEIGHT - 25, 20+15) imageName:@"0005_bookmark-open.png"];

    
    
    _count = 0;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.03
                                              target:self
                                            selector:@selector(onTimer:)
                                            userInfo:nil
                                             repeats:YES];
    [_timer setFireDate:[NSDate distantFuture]];
    
    _data = [[NSMutableDictionary alloc] initWithDictionary:[self getDictionaryFromPlist:@"menu"]];
    

    
    _showText = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    _showText.center = CGPointMake(SCREEN_WEIGHT /2.0, SCREEN_HEIGHT * 8.0/10.0 - 20);
    _showText.text = @"";
    [self.view addSubview:_showText];
    _showText.textColor = [UIColor whiteColor];
    _showText.font = [UIFont fontWithName:@"HYChenMeiZiJ" size:40.0];
    _showText.textAlignment = NSTextAlignmentCenter;
    _showText.hidden = YES;
    
    _detailButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    _detailButton.center = CGPointMake(SCREEN_WEIGHT /2.0, SCREEN_HEIGHT * 8.0/10.0 + 20);
    _detailButton.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_detailButton];
    _detailButton.hidden = YES;
    [_detailButton setTitle:@"了解更多" forState:UIControlStateNormal];
    [_detailButton setTitle:@"了解更多" forState:UIControlStateHighlighted];
    _detailButton.titleLabel.font = [UIFont fontWithName:@"HYChenMeiZiJ" size:15.0];
    _detailButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_detailButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_detailButton addTarget:self action:@selector(showWeb) forControlEvents:UIControlEventTouchUpInside];
    
    
    _menu = [[NSMutableArray alloc] init];
    _menu = [_data objectForKey:@"城市旅游"];
    

    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WEIGHT, SCREEN_HEIGHT)];
    _webView.delegate = self;
    [self.view addSubview:_webView];
    _webView.hidden = YES;
    
    UIView *black = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WEIGHT, 64)];
    [_webView addSubview:black];
    black.backgroundColor = [UIColor blackColor];
    
    
    UIButton *webcloseBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 44, 44)];
    [_webView addSubview:webcloseBtn];
    [webcloseBtn setImage:[UIImage imageNamed:@"btn_close.png"] forState:UIControlStateNormal];
    [webcloseBtn setImage:[UIImage imageNamed:@"btn_close.png"] forState:UIControlStateHighlighted];
    [webcloseBtn addTarget:self action:@selector(closeweb) forControlEvents:UIControlEventTouchUpInside];
}

- (void)showWeb
{
    _webView.hidden = NO;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[[_menu objectAtIndex:_i] objectForKey:@"url"]]];
    [_webView loadRequest:request];
}

- (void)closeweb
{
    _webView.hidden = YES;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    _pageControl.currentPage = page;
    if (_pageControl.currentPage == 0) {
        _menu = [_data objectForKey:@"城市旅游"];
    }
    if (_pageControl.currentPage == 1) {
        _menu = [_data objectForKey:@"著名景区"];
    }
    if (_pageControl.currentPage == 2) {
        _menu = [_data objectForKey:@"小众景点"];
    }
    if (_pageControl.currentPage == 3) {
        _menu = [_data objectForKey:@"亚洲"];
    }
    if (_pageControl.currentPage == 4) {
        _menu = [_data objectForKey:@"美欧澳非"];
    }
}

- (void)addTitle:(NSString *)string num:(int)num
{
    _kindOfPlace = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 130, 40)];
    [_scroll addSubview:_kindOfPlace];
    _kindOfPlace.text = string;
    _kindOfPlace.font = [UIFont fontWithName:@"HYChenMeiZiJ" size:30.0];
    _kindOfPlace.textColor = [UIColor whiteColor];
    _kindOfPlace.textAlignment = NSTextAlignmentCenter;
    _kindOfPlace.center = CGPointMake(_mainImageView.center.x + SCREEN_WEIGHT * (num - 1), _loop.center.y + _loop.frame.size.height/7.0 + 25);
    [self addlineWitnCenter:CGPointMake(_mainImageView.center.x, _kindOfPlace.center.y + _kindOfPlace.frame.size.height/2.0 + 5)];
}

- (void)addlineWitnCenter:(CGPoint)centerPoint
{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 130, 1)];
    [self.view addSubview:line];
    line.center = centerPoint;
    line.backgroundColor = [UIColor whiteColor];
}

- (void)initbtn:(int)tag centerPoint:(CGPoint)centerPoint imageName:(NSString *)imageName
{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [self.view addSubview:btn];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
    btn.center = centerPoint;
    btn.tag = tag;
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnAction:(UIButton *)sender
{
    //文艺标签
    if (sender.tag == 100001) {
        mottoViewController *mvc = [[mottoViewController alloc] init];
        
        //*******IMPORTANT,,,去掉present 后留下的黑色背景，
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
            
            mvc.modalPresentationStyle=UIModalPresentationOverCurrentContext;
            
        }else{
            
            self.modalPresentationStyle=UIModalPresentationCurrentContext;
            
        }
        [self presentViewController:mvc animated:YES completion:nil];
    }
    //setting
    if (sender.tag == 100002) {
        SettingViewController *svc = [[SettingViewController alloc] init];
        
        //*******IMPORTANT,,,去掉present 后留下的黑色背景，
        if ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0) {
            
            svc.modalPresentationStyle=UIModalPresentationOverCurrentContext;
            
        }else{
            
            self.modalPresentationStyle=UIModalPresentationCurrentContext;
            
        }
//        //后台执行：
//        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
//            
//            NSLog(@"begin");
//            //截图
//            NSInteger width = svc.view.frame.size.width;
//            NSInteger heihgt = svc.view.frame.size.height;
//            CGSize size = CGSizeMake(width,heihgt);
//            UIGraphicsBeginImageContext(size);
//            [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
//            UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//            UIGraphicsEndImageContext();
//            
//            
//            //通知主线程刷新
//            dispatch_async(dispatch_get_main_queue(), ^{
//                
//               // svc.view.backgroundColor = [UIColor colorWithPatternImage: [self blurryImage:image withBlurLevel:0.5f]];
//                svc.backImageView.image = [self blurryImage:image withBlurLevel:0.9f];
//            });
//            NSLog(@"end");
//        });
        [self presentViewController:svc animated:YES completion:nil];
    }
    //menu
    if (sender.tag == 100003) {
        MenuViewController *mvc = [[MenuViewController alloc] init];
        
        //*******IMPORTANT,,,去掉present 后留下的黑色背景，
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
            
            mvc.modalPresentationStyle=UIModalPresentationOverCurrentContext;
            
        }else{
            
            self.modalPresentationStyle=UIModalPresentationCurrentContext;
            
        }
        [self presentViewController:mvc animated:YES completion:nil];

    }
}
//毛玻璃效果。
- (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur {
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur * 100);
    boxSize = boxSize - (boxSize % 2) + 1;
    
    CGImageRef img = image.CGImage;
    
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    
    void *pixelBuffer;
    
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) *
                         CGImageGetHeight(img));
    
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    error = vImageBoxConvolve_ARGB8888(&inBuffer,
                                       &outBuffer,
                                       NULL,
                                       0,
                                       0,
                                       boxSize,
                                       boxSize,
                                       NULL,
                                       kvImageEdgeExtend);
    
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(
                                             outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    CFRelease(inBitmapData);
    
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    
    return returnImage;
}
- (void)buttonClicked:(UIButton *)sender
{
    [_timer setFireDate:[NSDate date]];
}

- (void)onTimer:(NSTimer *)sender
{
    
    _mainImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",_count%6]];
    
    _loop.progress = 0.1 * _count/7.0;
    _count ++;

     if (0.1 * _count/7.0 > 1.0) {
         _count = 0;
         _mainImageView.image = [UIImage imageNamed:@"6.png"];
         [_timer setFireDate:[NSDate distantFuture]];
         _loop.progress = 0.0;
         
         int i = arc4random() % [_menu count];
         _i = i;
         NSLog(@"%d",i);
         _showText.text = [[_menu objectAtIndex:i] objectForKey:@"name"];
         _showText.transform = CGAffineTransformMakeScale(0.05, 0.05);
         //后台执行：
         dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
             
             NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[_menu objectAtIndex:i] objectForKey:@"text"]] ofType:@"jpg"];
             //通知主线程刷新
             dispatch_async(dispatch_get_main_queue(), ^{
                 
                 _backgroundImageView.image = [UIImage imageWithContentsOfFile:path];
             });
             NSLog(@"end");
         });

         [UIView animateWithDuration:1
                          animations:^{
                              _showText.transform = CGAffineTransformMakeScale(2.0, 2.0);
                          }completion:^(BOOL finish){
                              [UIView animateWithDuration:0.5
                                               animations:^{
                                                   _showText.transform = CGAffineTransformMakeScale(1, 1);
                                               }completion:^(BOOL finish){
                                                   
                                               }];
                          }];
         _showText.hidden = NO;
         _detailButton.hidden = NO;
         
         
         if (_i % 5 ==0) {
             [JoyingMobiVideoAd initAppID:@"9770c0775bc66966" appKey:@"01dba75d7e625371"];
             
             //全屏广告
             [JoyingMobiVideoAd videoPlay:self videoPlayFinishCallBackBlock:^(BOOL isFinishPlay){
                 NSLog(@"播放结束");
             } videoPlayConfigCallBackBlock:^(BOOL isLegal){
                 NSLog(@"播放是否有效：%d",isLegal);
             }];
         }

     }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableDictionary *)getDictionaryFromPlist:(NSString *)plistName
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    return data;
}


@end
