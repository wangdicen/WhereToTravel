//
//  PositionViewModel.h
//  wheretotravel2
//
//  Created by 汪迪岑 on 2017/10/2.
//  Copyright © 2017年 汪迪岑. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyUtil.h"
#import "Header.h"

@interface PositionViewModel : NSObject

SingleH(PositionViewModel);

//保存主界面所有子视图的初始位置
@property (nonatomic,strong) NSMutableDictionary *mainViewDictionary;

//保存所有threecoupleview的子视图的初始位置
@property (nonatomic,strong) NSMutableDictionary *threeCoupleViewDictionary;


@end
