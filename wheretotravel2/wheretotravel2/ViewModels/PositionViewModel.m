//
//  PositionViewModel.m
//  wheretotravel2
//
//  Created by 汪迪岑 on 2017/10/2.
//  Copyright © 2017年 汪迪岑. All rights reserved.
//

#import "PositionViewModel.h"

@implementation PositionViewModel
SingleM(PositionViewModel);


- (instancetype)init
{
    if (self) {
        self = [super init];
    }
    if (_mainViewDictionary == nil) {
        _mainViewDictionary = [[NSMutableDictionary alloc] init];
        _threeCoupleViewDictionary = [[NSMutableDictionary alloc] init];
    }
    
    [self setMainViewCotrollerSubviewsPosition];
    [self setThreeCoupleViewCotrollerSubviewsPosition];
    
    return self;
}

//主视图
- (void)setMainViewCotrollerSubviewsPosition
{
    [_mainViewDictionary setObject:[self setPositionWithX:0 Y:0 W:SCREEN_WEIGHT H:SCREEN_HEIGHT CX:SCREEN_WEIGHT/2.0 CY:SCREEN_HEIGHT/2.0]
            forKey:UI_MAIN_SCROLL];
}

//threecoupleview
- (void)setThreeCoupleViewCotrollerSubviewsPosition
{
    if ([[DeviceJuage getDeviceName] isEqualToString:@"iPhone_X"]) {
        [_threeCoupleViewDictionary setObject:[self setPositionWithX:EDGE_NUM+10 Y:EDGE_NUM + 40 W:SCREEN_WEIGHT - EDGE_NUM*2 - 20 H:SCREEN_HEIGHT -EDGE_NUM*2 - 40 CX:SCREEN_WEIGHT/2.0 CY:SCREEN_HEIGHT/2.0 + 15] forKey:UI_THREECOUPLEVIEW_BACKGROUND];
    }
    else{
        [_threeCoupleViewDictionary setObject:[self setPositionWithX:EDGE_NUM Y:EDGE_NUM W:SCREEN_WEIGHT - EDGE_NUM*2 H:SCREEN_HEIGHT -EDGE_NUM*2 CX:SCREEN_WEIGHT/2.0 CY:SCREEN_HEIGHT/2.0] forKey:UI_THREECOUPLEVIEW_BACKGROUND];
    }
    
    [_threeCoupleViewDictionary setObject:[self setPositionWithX:0 Y:0 W:SCREEN_WEIGHT -EDGE_NUM*2 H:SCREEN_HEIGHT/10.0 CX:SCREEN_WEIGHT/2.0 - EDGE_NUM CY:SCREEN_HEIGHT/20.0] forKey:UI_THREECOUPLEVIEW_TITLEVIEW];
    [_threeCoupleViewDictionary setObject:[self setPositionWithX:0 Y:0 W:SCREEN_WEIGHT - EDGE_NUM*2.0 H:SCREEN_HEIGHT -EDGE_NUM*2 CX:SCREEN_WEIGHT/2.0 CY:SCREEN_HEIGHT/2.0] forKey:UI_THREECOUPLEVIEW_SCROLLVIEW];
    
}



- (WDCPostion *)setPositionWithX:(float)x Y:(float)y W:(float)w H:(float)h CX:(float)cx CY:(float)cy
{
    WDCPostion *position = [[WDCPostion alloc] init];
    position.centerToFather =  CGPointMake(cx, cy);
    position.positonToFather = CGRectMake(x, y, w, h);
    return position;
}


@end
