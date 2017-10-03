//
//  UIViewModel.m
//  wheretotravel2
//
//  Created by 汪迪岑 on 2017/10/2.
//  Copyright © 2017年 汪迪岑. All rights reserved.
//

#import "UIViewModel.h"

@implementation UIViewModel


+ (id)addViewWithString:(NSString *)string
                          InPostion:(WDCPostion *)position
                           OnFather:(id)father{
    Class myClass = NSClassFromString(string);
    UIView  *uiObj = [[myClass alloc] init];
    uiObj.frame = position.positonToFather;
    uiObj.center = position.centerToFather;
    [father addSubview:uiObj];
    return uiObj;
}

+ (id)addViewWithFrameWithString:(NSString *)string
             InPostion:(WDCPostion *)position
              OnFather:(id)father
{
    Class myClass = NSClassFromString(string);
    UIView  *uiObj = [[myClass alloc] initWithFrame:position.positonToFather];
    uiObj.center = position.centerToFather;
    [father addSubview:uiObj];
    return uiObj;
}

+ (void) displayOnController:(UIViewController *)controller
           ContentController: (UIViewController*) content
                        withFrame:(CGRect)frame
{
    [controller addChildViewController:content];
    content.view.frame = frame;
    [content didMoveToParentViewController:controller];
}

+ (void)showOrHideNavWithTitleView:(UIView *)title
                        scrollView:(UIScrollView *)scroll
                    contentSizeOff:(float)contentsizeof{
    CGFloat safeAreaMin = - (title.frame.size.height);
    
    CGRect rect = CGRectMake(0, 0, title.frame.size.width, title.frame.size.height);
    //超过contentview范围就开始隐藏title
    if (contentsizeof > scroll.frame.size.height/2.0)
    {
        [UIView animateWithDuration:0.5 animations:^{
            title.frame = CGRectMake(rect.origin.x, rect.origin.y + safeAreaMin, rect.size.width, rect.size.height);
            title.alpha = 0.0;
        }];
    }
    else if(contentsizeof < scroll.frame.origin.y )
    {
        [UIView animateWithDuration:0.5 animations:^{
            title.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
            title.alpha = 1.0;
        }];
        
    }
}

@end
