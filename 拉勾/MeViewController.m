//
//  MeViewController.m
//  拉勾
//
//  Created by Steven on 16/4/21.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import "MeViewController.h"
#import "MetableViewCells.h"


@interface MeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)NSArray *information;
@property(nonatomic,strong)NSArray *IconName;
@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configtableview];
    
    
}

-(NSArray *)information
{
    if (_information == nil) {
        _information = @[@"简历",@"PLUS",@"收藏",@"意见反馈",@"更多设置"];
    }
    return _information;
}

-(NSArray *)IconName
{
    if (_IconName == nil) {
        _IconName = @[@"icon_user_resume",@"icon_forget_password",@"icon_user_collect",@"icon_user_feedback",@"icon_user_setting"];
    }
    return _IconName;
}

-(void)configtableview
{
    _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    [self.view addSubview:_table];
    _table.delegate = self;
    _table.dataSource = self;
    [_table setScrollEnabled:NO];
    UIView *tableheadview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 180)];
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 180)];
    image.image = [UIImage imageNamed:@"user_photo_bg"];
    [tableheadview addSubview:image];
    _selfInfroBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
    _selfInfroBtn.center = tableheadview.center;
    _selfInfroBtn.backgroundColor = [UIColor greenColor];
    _selfInfroBtn.layer.cornerRadius = 30;
    _selfInfroBtn.layer.masksToBounds = 30;
    [_selfInfroBtn addTarget:self action:@selector(ClickselfInfoBtn) forControlEvents:UIControlEventTouchUpInside];
    [_selfInfroBtn setImage:[UIImage imageNamed:@"ic_avatar_default"] forState:UIControlStateNormal] ;
    [tableheadview addSubview:_selfInfroBtn];
    _table.tableHeaderView = tableheadview;
}

-(void)ClickselfInfoBtn
{
    UIAlertController *selfInfoShow = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"从相册中获取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [selfInfoShow addAction:action1];
    [selfInfoShow addAction:action2];
    [self presentViewController:selfInfoShow animated:YES completion:^{
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MetableViewCells *cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
    if (cell == nil) {
        cell = [[MetableViewCells alloc]initWithImage:[UIImage imageNamed:self.IconName[indexPath.row]] info:self.information[indexPath.row] Detail:nil];
        if (indexPath.row == 1) {
            cell.Detail.text = @"已开启";
        }
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0001;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
