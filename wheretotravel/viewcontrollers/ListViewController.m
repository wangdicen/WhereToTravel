//
//  ListViewController.m
//  wheretotravel
//
//  Created by 汪迪岑 on 16/9/17.
//  Copyright © 2016年 汪迪岑. All rights reserved.
//

#import "ListViewController.h"
#import "Header.h"
#import "ImageViewController.h"


@interface ListViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    int _indexPathRow;
    //数据。
    NSMutableArray *_menu;
}
@end

@implementation ListViewController


- (instancetype)initWithKey:(NSString *)key
{
    if (self) {
        self = [super init];
        self._title = key;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGB(61, 78, 97, 0.7);
    
    _menu = [[NSMutableArray alloc] init];
    
    NSDictionary *originalDic = [[NSDictionary alloc] initWithDictionary:[self getDictionaryFromPlist:@"menu"]];
    
    _menu = [originalDic objectForKey:self._title];
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WEIGHT, SCREEN_HEIGHT -40) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = NO;
    
    
    UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 15, 50, 50)];
    [self.view addSubview:closeBtn];
    closeBtn.center = CGPointMake(SCREEN_WEIGHT - 25, 20+15);
    [closeBtn setImage:[UIImage imageNamed:@"btn_close.png"] forState:UIControlStateNormal];
    [closeBtn setImage:[UIImage imageNamed:@"btn_close.png"] forState:UIControlStateHighlighted];
    [closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return [_menu count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"cell2-%ld",(long)indexPath.row]];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"cell2-%ld",(long)indexPath.row]];
    }
    
    cell.textLabel.text = [[_menu objectAtIndex:indexPath.row] objectForKey:@"name"];
    cell.textLabel.font = [UIFont fontWithName:@"HY-YiYQXJ" size:20.0];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}



- (void)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ImageViewController *dtvc = [[ImageViewController alloc] initWithDictionary:[_menu objectAtIndex:indexPath.row]];
    //*******IMPORTANT,,,去掉present 后留下的黑色背景，
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        
        dtvc.modalPresentationStyle=UIModalPresentationOverCurrentContext;
        
    }else{
        
        self.modalPresentationStyle=UIModalPresentationCurrentContext;
        
    }
    [self presentViewController:dtvc animated:YES completion:nil];
}


- (NSMutableDictionary *)getDictionaryFromPlist:(NSString *)plistName
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    return data;
}

@end
