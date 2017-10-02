//
//  MyCities.m
//  wheretotravel2
//
//  Created by 汪迪岑 on 2017/10/2.
//  Copyright © 2017年 汪迪岑. All rights reserved.
//

#import "MyCities.h"

@implementation MyCities

SingleM(MyCities)

- (instancetype)init
{
    if (self) {
        self = [super init];
    }
    //初始值为3个
    if (_cities == nil) {
        _cities = [[NSMutableArray alloc] initWithObjects:@"北京",@"成都",@"广州", nil];
    }
    return self;
}


@end
