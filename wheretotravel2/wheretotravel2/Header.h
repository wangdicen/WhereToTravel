//
//  Header.h
//  wheretotravel2
//
//  Created by 汪迪岑 on 2017/10/2.
//  Copyright © 2017年 汪迪岑. All rights reserved.
//

#ifndef Header_h
#define Header_h


#define SCREEN_WEIGHT  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height
#define RGB(a,b,c,d)     [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:d]
#define EDGE_NUM 3.0


//**************  MVVM  *******************
#ifdef __OBJC__

//Model
#import "WDCPostion.h"

//ViewModel
#import "UIViewModel.h"
#import "PositionViewModel.h"
#import "MyCities.h"
#import "DeviceJuage.h"

//View
#import "UIView+UIViewRoundCorners.h"
#import "CustomTabBarController.h"

//ViewController
#import "ThreeCoupleViewController.h"
#import "BaseViewController.h"
#import "MainViewController.h"

#endif


//**************  UI KEY *******************

//main view
#define UI_MAIN_SCROLL @"ui_main_scroll"

//three couplev iew
#define UI_THREECOUPLEVIEW_BACKGROUND @"ui_threecoupleview_background"

#endif /* Header_h */
