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



@end
