//
//  MoreAPPViewController.m
//  wheretotravel
//
//  Created by 汪迪岑 on 16/9/28.
//  Copyright © 2016年 汪迪岑. All rights reserved.
//

#import "MoreAPPViewController.h"
#import "Header.h"
#import "Toast.h"

@interface MoreAPPViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_array;
}

@end

@implementation MoreAPPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGB(61, 78, 97, 0.9);
    
    UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 15, 50, 50)];
    [self.view addSubview:closeBtn];
    closeBtn.center = CGPointMake(SCREEN_WEIGHT - 25, 20+15);
    [closeBtn setImage:[UIImage imageNamed:@"btn_close.png"] forState:UIControlStateNormal];
    [closeBtn setImage:[UIImage imageNamed:@"btn_close.png"] forState:UIControlStateHighlighted];
    [closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];

    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 70, SCREEN_WEIGHT - 20, SCREEN_HEIGHT - 70) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.rowHeight = 80;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _array = [NSArray arrayWithObjects:@"吃啥",@"玩啥", nil];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIImageView * imageView =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"icon%ld.png",indexPath.row+1]]];
        [cell addSubview:imageView];
        imageView.frame = CGRectMake(2, 2, 72, 72);
        cell.backgroundColor = [UIColor clearColor];
        
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(76, 2, 100, 40)];
        [cell addSubview:lbl];
        lbl.text = [_array objectAtIndex:indexPath.row];
        lbl.textColor = [UIColor whiteColor];
        lbl.backgroundColor = [UIColor clearColor];
        lbl.font = [UIFont fontWithName:@"HYChenMeiZiJ" size:32.0];
        
        UILabel *lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(76, 44, 230, 30)];
        [cell addSubview:lbl2];
        if (indexPath.row == 0) {
            lbl2.text = @"美食和壁纸的随机艺术";
        }
        if (indexPath.row == 1) {
            lbl2.text = @"周末休闲，聚会游戏大合集";
        }
        lbl2.backgroundColor = [UIColor clearColor];
        lbl2.textColor = [UIColor whiteColor];
        lbl2.font = [UIFont fontWithName:@"HYChenMeiZiJ" size:16.0];
    }
    

    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        NSString *str = [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=1154064691" ];
        if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)){
            str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id1154064691"];
        }
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    }
    if (indexPath.row == 1) {
        [Toast showText:@"即将上线！"];
    }
}

- (void)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
