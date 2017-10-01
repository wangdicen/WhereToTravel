//
//  SDLoopProgressView.m
//  SDProgressView
//
//  Created by aier on 15-2-19.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import "SDLoopProgressView.h"

@implementation SDLoopProgressView

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx2 = UIGraphicsGetCurrentContext();
    
    CGFloat xCenter2 = rect.size.width * 0.5;
    CGFloat yCenter2 = rect.size.height * 0.5;
    [[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0] set];
    
    //白圈的粗细
    CGContextSetLineWidth(ctx2, 15 * SDProgressViewFontScale-20);
    
    CGContextSetLineCap(ctx2, kCGLineCapRound);
    CGFloat to2 = - M_PI * 0.5 + self.progress * M_PI * 2 + 10; // 初始值0.05
    CGFloat radius2 = MIN(rect.size.width, rect.size.height) * 0.5 - SDProgressViewItemMargin;
    CGContextAddArc(ctx2, xCenter2, yCenter2, radius2, - M_PI * 0.5, to2, 0);
    CGContextStrokePath(ctx2);
    
    
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    [[UIColor colorWithRed:92.0/255.0 green:180.0/255.0 blue:82.0/255.0 alpha:1.0] set];
    
    //进度圈的粗细
    CGContextSetLineWidth(ctx, 15 * SDProgressViewFontScale-20);
    
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGFloat to = - M_PI * 0.5 + self.progress * M_PI * 2 + 0.0; // 初始值0.05
    CGFloat radius = MIN(rect.size.width, rect.size.height) * 0.5 - SDProgressViewItemMargin;
    CGContextAddArc(ctx, xCenter, yCenter, radius, - M_PI * 0.5, to, 0);
    CGContextStrokePath(ctx);
    
//    // 进度数字
//    NSString *progressStr = [NSString stringWithFormat:@"%.0f", self.progress * 100];
//    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
//    attributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20 * SDProgressViewFontScale];
//    attributes[NSForegroundColorAttributeName] = [UIColor colorWithRed:255.0/255.0 green:188.0/255.0 blue:2.0/255.0 alpha:1.0];
//    [self setCenterProgressText:progressStr withAttributes:attributes];
}

@end
