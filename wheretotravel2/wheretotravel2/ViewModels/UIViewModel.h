//
//  UIViewModel.h
//  wheretotravel2
//
//  Created by 汪迪岑 on 2017/10/2.
//  Copyright © 2017年 汪迪岑. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Header.h"


@interface UIViewModel : NSObject

//快速添加子视图，省略初始化add和位置的设置
//string:类名，
//position：通过PositionViewModel来找到空间的位置
//father：控件的父亲视图
+ (id)addViewWithString:(NSString *)string
                          InPostion:(WDCPostion *)position
                       OnFather:(id)father;



@end
