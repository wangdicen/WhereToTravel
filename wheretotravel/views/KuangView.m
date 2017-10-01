//
//  KuangView.m
//  wheretotravel
//
//  Created by 汪迪岑 on 16/9/16.
//  Copyright © 2016年 汪迪岑. All rights reserved.
//

#import "KuangView.h"
#import "Header.h"

@implementation KuangView

- (instancetype)initWithImageName:(NSString *)imageName
                    text1:(NSString *)text1
                    text2:(NSString *)text2
                 cityOrAuthorName:(NSString *)string
                            frame:(CGRect)frame
{
    
    if (self) {
        self = [super initWithFrame:frame];
        self.cityOrAuthorName = string;
        
        
        UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:frame];
        backgroundView.image =  [UIImage imageNamed:imageName];
        [self addSubview:backgroundView];
        
        UIView *view = [[UIView alloc] initWithFrame:frame];
        view.backgroundColor = RGB(0, 0, 0, 0.5);
        [self addSubview:view];
        
        UIImageView *kuangView = [[UIImageView alloc] initWithFrame:frame];
        kuangView.image =  [UIImage imageNamed:@"kuang.png"];
        [self addSubview:kuangView];
        
        UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, 200, 30)];
        
        timeLabel.backgroundColor = [UIColor clearColor];
        timeLabel.center = CGPointMake(timeLabel.center.x + 5, self.frame.size.height - 15);
        timeLabel.textColor = [UIColor blackColor];
        timeLabel.font = [UIFont fontWithName:@"HYChenMeiZiJ" size:15.0];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"YYYY年MM月dd日"];
        NSString *timestamp = [formatter stringFromDate:[NSDate date]];
        [timeLabel setText:timestamp];
        [self addSubview:timeLabel];
        
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 30,self.frame.size.height -30)];
        
        label1.text = text1;
        label1.numberOfLines = [label1.text length];
        label1.font = [UIFont fontWithName:@"HYChenMeiZiJ" size:32.0];
        label1.textColor = [UIColor whiteColor];
        label1.center = CGPointMake(self.center.x +20, self.center.y -10);
        [self addSubview:label1];
        
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 30,self.frame.size.height -30)];
        
        label2.text = text2;
        label2.numberOfLines = [label2.text length];
        label2.font = [UIFont fontWithName:@"HYChenMeiZiJ" size:32.0];
        label2.textColor = [UIColor whiteColor];
        label2.center = CGPointMake(self.center.x -20, self.center.y -10);
        [self addSubview:label2];
        
        UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 25,self.frame.size.height/3.0)];
        
        label3.text = string;
        label3.numberOfLines = [label3.text length];
        label3.font = [UIFont fontWithName:@"HYChenMeiZiJ" size:27.0];
        label3.textColor = [UIColor whiteColor];
        label3.center = CGPointMake(40, self.frame.size.height - 150);
        [self addSubview:label3];

        
    }
    
    return self;
    
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSNumber *TAG = [NSNumber numberWithInteger:self.tag];
    NSString *TITLE = self.cityOrAuthorName;
    
    if (self.tag == 20001) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"goToListViewController" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:TAG, @"tag",
                                                                TITLE, @"title",nil]];
    }
    if (self.tag == 20002) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"goToListViewController" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:TAG, @"tag",
                                                                                                                  TITLE, @"title",nil]];
    }
    if (self.tag == 20003) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"goToListViewController" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:TAG, @"tag",
                                                                                                                  TITLE, @"title",nil]];
    }
    if (self.tag == 20004) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"goToListViewController" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:TAG, @"tag",
                                                                                                                  TITLE, @"title",nil]];
    }
    if (self.tag == 20005) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"goToListViewController" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:TAG, @"tag",
                                                                                                                  TITLE, @"title",nil]];
    }
    
    
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    

}

@end
