//
//  ImageViewController.m
//  wheretotravel
//
//  Created by 汪迪岑 on 16/9/17.
//  Copyright © 2016年 汪迪岑. All rights reserved.
//

#import "ImageViewController.h"
#import "Header.h"

@interface ImageViewController ()<UIWebViewDelegate>
{
    NSDictionary *_dic;
    
    //半透明背景图
    UIView *_backView1;
    UIView *_backView2;
    UIView *_backView3;
    UIView *_backView4;
    UIView *_backView5;
    
    
    UIScrollView *_scroll;
    
    UIWebView *_webView;
    
    //Data
    NSMutableArray  *_data;
}
@end

@implementation ImageViewController

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if (self) {
        self = [super init];
        _dic = dictionary;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //----
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WEIGHT, SCREEN_HEIGHT)];
    [self.view addSubview:backgroundImageView];
    
            //后台执行：
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
    
                NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[_dic objectForKey:@"text"]] ofType:@"jpg"];
            //通知主线程刷新
               dispatch_async(dispatch_get_main_queue(), ^{
    
                   backgroundImageView.image = [UIImage imageWithContentsOfFile:path];
                });
                NSLog(@"end");
           });

    
    
//    
//    

    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 70,self.view.frame.size.height)];
    label1.text = [_dic objectForKey:@"name"];
    label1.numberOfLines = [label1.text length];
    label1.font = [UIFont fontWithName:@"HYChenMeiZiJ" size:70.0];
    label1.textColor = [UIColor whiteColor];
    label1.center = CGPointMake(45, self.view.frame.size.height - label1.frame.size.height/2.0);
    [self.view addSubview:label1];
    
    //----
    _scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WEIGHT, SCREEN_HEIGHT)];
    _scroll.backgroundColor = [UIColor clearColor];
   // _scroll.delegate = self;
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
    
    
    UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 15, 50, 50)];
    [self.view addSubview:closeBtn];
    closeBtn.center = CGPointMake(SCREEN_WEIGHT - 25, 20+15);
    [closeBtn setImage:[UIImage imageNamed:@"btn_close.png"] forState:UIControlStateNormal];
    [closeBtn setImage:[UIImage imageNamed:@"btn_close.png"] forState:UIControlStateHighlighted];
    [closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *downloadBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 15, 180, 50)];
    [self.view addSubview:downloadBtn];
    downloadBtn.center = CGPointMake(SCREEN_WEIGHT - 25, 20+15);
    downloadBtn.center = CGPointMake(SCREEN_WEIGHT/2.0, SCREEN_HEIGHT/2.0 - 30);
    downloadBtn.titleLabel.font = [UIFont fontWithName:@"HYChenMeiZiJ" size:25.0];

    [downloadBtn setTitle:@"下载背景图片" forState:UIControlStateNormal];
    [downloadBtn setTitle:@"下载背景图片" forState:UIControlStateHighlighted];
    [downloadBtn addTarget:self action:@selector(download) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 1.5)];
    [self.view addSubview:line];
    line.backgroundColor = [UIColor whiteColor];
    line.center = CGPointMake(SCREEN_WEIGHT/2.0, SCREEN_HEIGHT/2.0);
    
    
    UIButton *webBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 15, 180, 50)];
    [self.view addSubview:webBtn];
    webBtn.center = CGPointMake(SCREEN_WEIGHT - 25, 20+15);
    webBtn.center = CGPointMake(SCREEN_WEIGHT/2.0, SCREEN_HEIGHT/2.0 + 30);
    webBtn.titleLabel.font = [UIFont fontWithName:@"HYChenMeiZiJ" size:25.0];
    
    [webBtn setTitle:@"了解更多" forState:UIControlStateNormal];
    [webBtn setTitle:@"了解更多" forState:UIControlStateHighlighted];
    [webBtn addTarget:self action:@selector(web) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 130,self.view.frame.size.height)];
    label2.text = @"（左右滑试试）";
    label2.font = [UIFont fontWithName:@"HYChenMeiZiJ" size:15.0];
    label2.textColor = [UIColor whiteColor];
    label2.center = CGPointMake(webBtn.center.x, webBtn.center.y + 35);
    [self.view addSubview:label2];
    
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

- (void)web
{
    _webView.hidden = NO;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[_dic objectForKey:@"url"]]];
    [_webView loadRequest:request];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}


- (void)saveImageToPhotos:(UIImage*)savedImage
{
    UIImageWriteToSavedPhotosAlbum(savedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}
// 指定回调方法

- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo
{
    
    NSString *msg = nil ;
    if(error != NULL){
        msg = @"保存图片失败" ;
    }else{
        msg = @"保存图片成功" ;
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:msg
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)download
{
    NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[_dic objectForKey:@"text"]] ofType:@"jpg"];
    [self saveImageToPhotos:[UIImage imageWithContentsOfFile:path]];
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
