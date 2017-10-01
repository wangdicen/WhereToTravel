//
//  Toast.m
//  iFunnyGif
//
//  Created by tangwei1 on 14-9-1.
//  Copyright (c) 2014年 tangwei1. All rights reserved.
//

#import "Toast.h"
#import <QuartzCore/QuartzCore.h>

@implementation Toast
{
    UILabel* _label;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _label = [[[UILabel alloc] init] autorelease];
        _label.backgroundColor = [UIColor clearColor];
        _label.textColor = [UIColor whiteColor];
        _label.font = [UIFont systemFontOfSize:14];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.adjustsFontSizeToFitWidth = YES;
        
        [self addSubview:_label];
        
//        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.8];
        
        self.backgroundColor = [UIColor blackColor];
        
        self.frame = CGRectMake(0, 0, 320 * 0.618, 40);
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        
        _label.frame = CGRectInset(self.bounds, 10, 0);
    }
    return self;
}

+ (void)showText:(NSString *)text
{
    [self showText:text forView:[[UIApplication sharedApplication].windows objectAtIndex:0]];
}

+ (void)showText:(NSString *)text forView:(UIView *)superView
{
    Toast* t = [[[Toast alloc] init] autorelease];
    [superView addSubview:t];
    [superView bringSubviewToFront:t];
    
    [t showText:text];
}

- (void)showText:(NSString *)text
{
    _label.text = text;
    
    CGRect rect = self.superview.bounds;
    self.center = CGPointMake(CGRectGetWidth(rect) * 0.5, CGRectGetHeight(rect) * ( 1 - 0.618 ));
    
    self.alpha = 0.0;
    
    [UIView animateWithDuration:.3 animations:^{
        self.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.5 delay:.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.alpha = 0.0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }];
}

@end
