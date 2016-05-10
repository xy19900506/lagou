//
//  DetailJob.m
//  拉勾
//
//  Created by Steven on 16/5/6.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import "DetailJob.h"
#import "DetailJobShareView.h"
#define KscreenW     [UIScreen mainScreen].bounds.size.width
#define KscreenH     [UIScreen mainScreen].bounds.size.height

@interface DetailJob ()<DetailJobShareViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)DetailJobShareView *sharedView;
@property(nonatomic,strong)NSArray *ButtonIconArray;
@property(nonatomic,strong)NSArray *TitleButtonArray;
@property(nonatomic,strong)UIBarButtonItem *CollectBtn;
@property(nonatomic,strong)UITableView *DetailTable;
@end

@implementation DetailJob

-(instancetype)init
{
    if (self = [super init]) {
        self.view.backgroundColor = [UIColor whiteColor];
        [self creatToolView];
        self.title = @"职位详情";
        //self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNavigationBar];
    [self Loaddata];
    [self configTableview];
    
    
    
}

-(void)configNavigationBar
{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ic_back"] style:UIBarButtonItemStylePlain target:self action:@selector(dismissViewController:)];
    self.navigationItem.leftBarButtonItem = backButton;
    backButton.tintColor = [UIColor lightGrayColor];
    _CollectBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_collect"] style:UIBarButtonItemStylePlain target:self action:@selector(collectBtnClick:)];
    _CollectBtn.tintColor = [UIColor lightGrayColor];
    UIBarButtonItem  *Shared = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_share"] style:UIBarButtonItemStylePlain target:self action:@selector(sharedBtnClick:)];
    Shared.tintColor = [UIColor lightGrayColor];
    self.navigationItem.rightBarButtonItems = @[_CollectBtn,Shared];
    
}
-(void)Loaddata
{
    _ButtonIconArray = @[@"jd_wx_friend",@"jd_wx",@"jd_qq",@"jd_sinawb",@"jd_web"];
    _TitleButtonArray = @[@"微信好友",@"微信朋友圈",@"QQ好友",@"微博",@"浏览器打开"];
}
-(void)dismissViewController:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)configTableview
{
    _DetailTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KscreenW, KscreenH-50) style:UITableViewStyleGrouped];
    [self.view addSubview:_DetailTable];
    _DetailTable.delegate = self;
    _DetailTable.dataSource = self;
}

-(void)creatToolView
{
    UIView *footview = [[UIView alloc]initWithFrame:CGRectMake(0, KscreenH-50, KscreenW, 50)];
    UIButton *SendResume = [[UIButton alloc]initWithFrame:CGRectMake(KscreenW/12.f, 5, KscreenW/4.f, 40)];
    [SendResume setTitle:@"发送简历" forState:UIControlStateNormal];
    [SendResume setTitleColor:[UIColor colorWithRed:0/255.f green:199/255.f blue:140/255.f alpha:1] forState:UIControlStateNormal];
    SendResume.backgroundColor = [UIColor whiteColor];
    SendResume.layer.cornerRadius = 4;
    [SendResume.layer setMasksToBounds:YES];
    [SendResume.layer setBorderWidth:1.f];
    SendResume.titleLabel.font = [UIFont systemFontOfSize:15];
    //CGColorSpaceRef colorspaceref = CGColorSpaceCreateDeviceRGB();
    //CGColorRef color = CGColorCreate(colorspaceref, (CGFloat []){0,0.78,0.55});
    [SendResume.layer setBorderColor:[UIColor colorWithRed:0/255.f green:199/255.f blue:140/255.f alpha:1].CGColor];
    UIButton *Chat = [[UIButton alloc]initWithFrame:CGRectMake(5*KscreenW/12.f, 5, KscreenW/2.f, 40)];
    [Chat setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Chat setTitle:@"和TA聊聊" forState:UIControlStateNormal];
    Chat.titleLabel.font = [UIFont systemFontOfSize:15.f];
    Chat.layer.cornerRadius = 4;
    Chat.backgroundColor = [UIColor colorWithRed:0/255.f green:199/255.f blue:140/255.f alpha:1];
    footview.backgroundColor = [UIColor clearColor];
    [footview addSubview:SendResume];
    [footview addSubview:Chat];
    [self.view addSubview:footview];
}
-(void)collectBtnClick:(UIBarButtonItem *)sender
{
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"收藏成功！！！" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
//    [alert show];
}

-(void)sharedBtnClick:(UIBarButtonItem *)sender
{
    _sharedView = [[DetailJobShareView alloc]initWithButtonArray:_ButtonIconArray AndTitleArray:_TitleButtonArray];
    _sharedView.contentView.frame = CGRectMake(0, KscreenH - 130, KscreenW, 130);
    _sharedView.Delegate = self;
    [_sharedView show];
}

#pragma -mark CancelBtnDelegate

-(void)ShareViewCancelBtnClick:(UIButton *)button
{
    [_sharedView removeFromSuperview];
    _sharedView = nil;
}



#pragma -mark  TableViewDelegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"123"];
        cell.textLabel.text = @"看着还可以，你说是不是，不找我行吗";
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
        }
    }
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return KscreenH/5.f;
        }
        else
            return 50;
    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 0) {
            return 44;
        }
        else
            return 55;
    }
    else if (indexPath.section == 2)
    {
        if (indexPath.row == 0) {
            return 44;
        }
        else
            return 100;
    }
    else if (indexPath.section == 3)
    {
        if (indexPath.row == 0) {
            return 44;
        }
        else
            return 70;
    }
    else
    {
        if (indexPath.row == 0) {
            return 44;
        }
        else
            return 200;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}




@end
