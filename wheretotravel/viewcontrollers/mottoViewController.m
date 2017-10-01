//
//  mottoViewController.m
//  wheretotravel
//
//  Created by 汪迪岑 on 16/9/16.
//  Copyright © 2016年 汪迪岑. All rights reserved.
//

#import "mottoViewController.h"
#import "Header.h"
#import "KuangView.h"
#import "WXApi.h"

@interface mottoViewController ()<WXApiDelegate>
{
    KuangView *kuang;
}
@end

@implementation mottoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGB(61, 78, 97, 0.8);
    
    UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 15, 50, 50)];
    [self.view addSubview:closeBtn];
    closeBtn.center = CGPointMake(self.view.center.x, SCREEN_HEIGHT - 40);
    [closeBtn setImage:[UIImage imageNamed:@"btn_close.png"] forState:UIControlStateNormal];
    [closeBtn setImage:[UIImage imageNamed:@"btn_close.png"] forState:UIControlStateHighlighted];
    [closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"motto" ofType:@"plist"];
    NSArray *data = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
    
    int i = random()%9 + 1;
    int i2 = random() % (int)[data count];
    
    kuang = [[KuangView alloc] initWithImageName:[NSString stringWithFormat:@"%d.jpg",i]
                                                      text1:[[data objectAtIndex:i2] objectForKey:@"text1"]
                                                      text2:[[data objectAtIndex:i2] objectForKey:@"text2"]
                                           cityOrAuthorName:[[data objectAtIndex:i2] objectForKey:@"author"]
                                                      frame:CGRectMake(0, 0, SCREEN_WEIGHT*2.0/3.0, SCREEN_HEIGHT*2.0/3.0)];
    
    kuang.center = CGPointMake(SCREEN_WEIGHT / 2.0, SCREEN_HEIGHT *2.0/5.0);
    [self.view addSubview:kuang];
    
    UIButton *shareWXBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    shareWXBtn.center = CGPointMake(kuang.center.x - 55, kuang.center.y + SCREEN_HEIGHT *2.0/6.0 + 50);
    [shareWXBtn setImage:[UIImage imageNamed:@"weixin.png"] forState:UIControlStateNormal];
    [shareWXBtn setImage:[UIImage imageNamed:@"weixin.png"] forState:UIControlStateHighlighted];
    [self.view addSubview:shareWXBtn];
    [shareWXBtn addTarget:self action:@selector(shareWX) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *sharePYQBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    sharePYQBtn.center = CGPointMake(kuang.center.x, kuang.center.y + SCREEN_HEIGHT *2.0/6.0 + 50);
    [sharePYQBtn setImage:[UIImage imageNamed:@"pengyouquan.png"] forState:UIControlStateNormal];
    [sharePYQBtn setImage:[UIImage imageNamed:@"pengyouquan.png"] forState:UIControlStateHighlighted];
    [self.view addSubview:sharePYQBtn];
    [sharePYQBtn addTarget:self action:@selector(sharePYQ) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *downloadBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    downloadBtn.center = CGPointMake(kuang.center.x + 50, kuang.center.y + SCREEN_HEIGHT *2.0/6.0 + 50);
    [downloadBtn setImage:[UIImage imageNamed:@"preview.png"] forState:UIControlStateNormal];
    [downloadBtn setImage:[UIImage imageNamed:@"preview.png"] forState:UIControlStateHighlighted];
    [self.view addSubview:downloadBtn];
    [downloadBtn addTarget:self action:@selector(download) forControlEvents:UIControlEventTouchUpInside];
}

- (void)shareWX
{
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage: [UIImage imageNamed:@"120.png"]];
    WXImageObject *imageObject = [WXImageObject object];
    
    NSString *pngPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Test.png"];
    [UIImagePNGRepresentation([self convertViewToImage:kuang]) writeToFile:pngPath atomically:YES];
    
    NSString *filePath = pngPath;//[[NSBundle mainBundle] pathForResource:@"xiangyang" ofType:@"jpg"];
    imageObject.imageData = [NSData dataWithContentsOfFile:filePath];
    message.mediaObject = imageObject;
    
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = WXSceneSession;
    [WXApi sendReq:req];
}

- (UIImage*)convertViewToImage:(UIView*)v
{
    
    UIGraphicsBeginImageContext(v.bounds.size);
    
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)sharePYQ
{
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage: [UIImage imageNamed:@"weixin.png"]];
    WXImageObject *imageObject = [WXImageObject object];
    
    NSString *pngPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Test.png"];
    [UIImagePNGRepresentation([self convertViewToImage:kuang]) writeToFile:pngPath atomically:YES];
    
    NSString *filePath = pngPath;//[[NSBundle mainBundle] pathForResource:@"xiangyang" ofType:@"jpg"];
    imageObject.imageData = [NSData dataWithContentsOfFile:filePath];
    message.mediaObject = imageObject;
    
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = WXSceneTimeline;
    [WXApi sendReq:req];
}

- (void)download
{
    [self saveImageToPhotos:[self convertViewToImage:kuang]];
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
