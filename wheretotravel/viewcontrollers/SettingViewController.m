//
//  SettingViewController.m
//  wheretotravel
//
//  Created by 汪迪岑 on 16/9/16.
//  Copyright © 2016年 汪迪岑. All rights reserved.
//

#import "SettingViewController.h"
#import "Header.h"
#import "MoreAPPViewController.h"
#import "AboutViewController.h"
#import "Toast.h"
#import "WXApi.h"
#import "JoyingMobiVideoAd.h"

@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate>
{
    NSArray *_array;
    UIWebView *_webView;
}
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGB(61, 78, 97, 0.8);
    //----
//    self.backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WEIGHT, SCREEN_HEIGHT)];
//    [self.view addSubview:self.backImageView];
//    self.backImageView.alpha = 1.0;
    //_backgroundImageView.image = [UIImage imageNamed:@"IMG_2048.jpg"];
    
    
    UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 15, 50, 50)];
    [self.view addSubview:closeBtn];
    [closeBtn setImage:[UIImage imageNamed:@"btn_close.png"] forState:UIControlStateNormal];
    [closeBtn setImage:[UIImage imageNamed:@"btn_close.png"] forState:UIControlStateHighlighted];
    [closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mountains.png"]];
    [self.view addSubview:imageView];
    imageView.frame = CGRectMake(0, 0, SCREEN_WEIGHT/2.0, SCREEN_WEIGHT/2.0);
    imageView.center = CGPointMake(SCREEN_WEIGHT/2.0, SCREEN_HEIGHT/4.0);
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    lbl.font = [UIFont fontWithName:@"HYChenMeiZiJ" size:35.0];
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.center = CGPointMake(imageView.center.x, imageView.center.y + imageView.frame.size.height/2.0 +23);
    lbl.textColor = [UIColor whiteColor];
    lbl.text = @"游啥";
    [self.view addSubview:lbl];
    
    UILabel *lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 180, 80)];
    lbl2.font = [UIFont fontWithName:@"HYChenMeiZiJ" size:15.0];
    lbl2.textAlignment = NSTextAlignmentCenter;
    lbl2.center = CGPointMake(lbl.center.x, lbl.center.y + lbl.frame.size.height/2.0 +23);
    lbl2.textColor = [UIColor whiteColor];
    lbl2.text = @"感受随机之美";
    [self.view addSubview:lbl2];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, SCREEN_HEIGHT/2.0, SCREEN_WEIGHT - 20, SCREEN_HEIGHT/2.0) style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor clearColor];
    //    tableView.rowHeight = 70;
    _array = [NSArray arrayWithObjects:@"分享游啥给好友",@"给我打分",@"更多APP",@"关于",@"看广告支持开发者😊", nil];
    
    
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

- (void)closeweb
{
    _webView.hidden = YES;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 4;
    }
    else
    {
        return 1;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    
    cell.textLabel.text = [_array objectAtIndex:indexPath.section * 4 + indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"HYChenMeiZiJ" size:18.0];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 0) {
        //分享给好友
        if (indexPath.row == 0) {
            SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
 
            WXMediaMessage *message = [WXMediaMessage message];
            [message setThumbImage: [UIImage imageNamed:@"120.png"]];
            WXImageObject *imageObject = [WXImageObject object];
            NSString *filePath = [[NSBundle mainBundle] pathForResource:@"120" ofType:@"png"];
            imageObject.imageData = [NSData dataWithContentsOfFile:filePath];
            message.mediaObject = imageObject;
            req.text = @"难得下到这么文艺的app，旅行再也不用纠结去哪了，你也赶快下一个吧～。itunes.apple.com/app/id1154855893";
            req.bText = YES;
            req.message = message;
            req.scene = WXSceneTimeline;
            [WXApi sendReq:req];
        }
        //给我打分
        if (indexPath.row == 1) {
            NSString *str = [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=1154855893" ];
            if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)){
                str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id1154855893"];
            }
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        }
        //更多app
        if (indexPath.row == 2) {
            dispatch_async(dispatch_get_main_queue(), ^{
            MoreAPPViewController *mavc  = [[MoreAPPViewController alloc] init];
            //*******IMPORTANT,,,去掉present 后留下的黑色背景，
            if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
                
                mavc.modalPresentationStyle=UIModalPresentationOverCurrentContext;
                
            }else{
                
                self.modalPresentationStyle=UIModalPresentationCurrentContext;
                
            }
            [self presentViewController:mavc animated:YES completion:nil];
            });
        }
        //关于
        if (indexPath.row == 3) {
            dispatch_async(dispatch_get_main_queue(), ^{
            AboutViewController *avc  = [[AboutViewController alloc] init];
            //*******IMPORTANT,,,去掉present 后留下的黑色背景，
            if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
                
                avc.modalPresentationStyle=UIModalPresentationOverCurrentContext;
                
            }else{
                
                self.modalPresentationStyle=UIModalPresentationCurrentContext;
                
            }
            [self presentViewController:avc animated:YES completion:nil];
            });
        }
    }
    
    if (indexPath.section == 1) {
//        //dashang
//        if (indexPath.row == 0) {
//            _webView.hidden = NO;
//            NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.jianshu.com/p/c26454d37896"]];
//            [_webView loadRequest:request];
//        }
        //guanggao
        if (indexPath.row == 0)
        {
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
