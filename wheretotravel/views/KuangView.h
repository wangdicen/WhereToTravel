//
//  KuangView.h
//  wheretotravel
//
//  Created by 汪迪岑 on 16/9/16.
//  Copyright © 2016年 汪迪岑. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KuangView : UIView

@property (nonatomic, assign) NSString *backImageName;

@property (nonatomic, assign) NSString *text1;

@property (nonatomic, assign) NSString *text2;

@property (nonatomic, assign) NSString *cityOrAuthorName;

- (instancetype)initWithImageName:(NSString *)imageName
                            text1:(NSString *)text1
                            text2:(NSString *)text2
                 cityOrAuthorName:(NSString *)string
                            frame:(CGRect)frame;


@end
