//
//  ListViewController.h
//  wheretotravel
//
//  Created by 汪迪岑 on 16/9/17.
//  Copyright © 2016年 汪迪岑. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController

@property (nonatomic,assign) NSInteger tagggg;

@property (nonatomic,assign) NSString *_title;

- (instancetype)initWithKey:(NSString *)key;

@end
