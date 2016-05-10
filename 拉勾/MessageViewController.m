//
//  MessageViewController.m
//  拉勾
//
//  Created by Steven on 16/4/21.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageTableViewCell.h"
#import "WhoSeeMe.h"
#import "ResumeState.h"
#import "InviteNotification.h"

@interface MessageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *MessageTable;
@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configtable];
    
}

-(void)configtable
{
    self.title = @"消息列表";
    _MessageTable = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:_MessageTable];
    //_MessageTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _MessageTable.delegate = self;
    _MessageTable.dataSource = self;
}

#pragma -mark MessageTable delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }
    else
    {
        return _cellCountArray.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *iconname = @[@"icon_who_look_me",@"icon_state_resume",@"icon_notify_invite"];
    NSArray *nametitle = @[@"谁看过我",@"简历状态通知",@"职位邀请通知"];
    NSArray *detaile = @[@"暂无新消息",@"您有一条新消息",@"暂无职位邀请"];
    MessageTableViewCell *messagecell = [tableView cellForRowAtIndexPath:indexPath];
    if (messagecell == nil) {
        messagecell = [[MessageTableViewCell alloc]initWithImage:iconname[indexPath.row] WithName:nametitle[indexPath.row] WithDetail:detaile[indexPath.row]];
    }
    return messagecell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0001;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backItem;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            self.hidesBottomBarWhenPushed = YES;
            WhoSeeMe *whoseeme = [[WhoSeeMe alloc]init];
            [self.navigationController pushViewController:whoseeme animated:YES];
            self.hidesBottomBarWhenPushed = NO;
        }
        if (indexPath.row == 1) {
            self.hidesBottomBarWhenPushed = YES;
            ResumeState *resumestate = [[ResumeState alloc]init];
            [self.navigationController pushViewController:resumestate animated:YES];
            self.hidesBottomBarWhenPushed = NO;
        }
        if (indexPath.row == 2) {
            self.hidesBottomBarWhenPushed = YES;
            InviteNotification *notification = [[InviteNotification alloc]init];
            [self.navigationController pushViewController:notification animated:YES];
            self.hidesBottomBarWhenPushed = NO;
        }
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
