//
//  MyTitleView.h
//  wheretotravel2
//
//  Created by 汪迪岑 on 2017/10/3.
//  Copyright © 2017年 汪迪岑. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"
@interface MyTitleView : UIView
{
    UILabel *_title;
}

@property (nonatomic,strong) NSString *titleName;

@property (nonatomic,strong) UIButton *leftBtn;

@property (nonatomic,strong) UIButton *rightBtn;

@end
