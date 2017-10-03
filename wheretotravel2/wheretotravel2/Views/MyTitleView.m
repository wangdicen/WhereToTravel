//
//  MyTitleView.m
//  wheretotravel2
//
//  Created by 汪迪岑 on 2017/10/3.
//  Copyright © 2017年 汪迪岑. All rights reserved.
//

#import "MyTitleView.h"

@implementation MyTitleView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self) {
        self = [super initWithFrame:frame];
    }
    
    self.backgroundColor = FlatBlack;
    
    if (_title == nil) {
        _title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width / 6, frame.size.height - 4)];
    }
    _title.center = CGPointMake(frame.size.width/2.0, frame.size.height/2.0);
    //初始值
    self.titleName = @"广州";
    _title.textColor = FlatWhite;
    _title.font = [UIFont fontWithName:@"HYChenMeiZiJ" size:30.0];
    [self addSubview:_title];
    
    if (_leftBtn == nil) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftBtn.frame =  CGRectMake(5, (frame.size.height - frame.size.width / 9.0)/2.0 , frame.size.width / 9.0, frame.size.width / 9.0);
    }
    _leftBtn.backgroundColor = ClearColor;
    [self addSubview:_leftBtn];
    
    if (_rightBtn == nil) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.frame = CGRectMake(frame.size.width - frame.size.width / 9.0 -5, (frame.size.height - frame.size.width / 9.0)/2.0, frame.size.width / 9.0, frame.size.width / 9.0);
    }
    [self addSubview:_rightBtn];
    _rightBtn.backgroundColor = ClearColor;
    
    [_leftBtn setImage:IMAGE(@"0002_file") forState:UIControlStateNormal];
    [_rightBtn setImage:IMAGE(@"0005_bookmark-open.png") forState:UIControlStateNormal];
    
    [self applyRoundCorners:UIRectCornerAllCorners radius:10];
    return self;
}

-(void)setTitleName:(NSString *)titleName
{
    _titleName = titleName;
    _title.text = titleName;
}
@end
