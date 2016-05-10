//
//  FirstPageControllerViewController.m
//  拉勾
//
//  Created by Steven on 16/4/21.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import "FirstPageControllerViewController.h"
#import "FirstPageSearchBarController.h"
#import "FirstPageDataModel.h"
#import "FirstPageTableViewCell.h"
#import "DetailJob.h"

#define KscreenW     [UIScreen mainScreen].bounds.size.width
#define KscreenH     [UIScreen mainScreen].bounds.size.height

@interface FirstPageControllerViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView *BasicTableView;
@property(strong,nonatomic)NSArray     *FirstPageModelArray;
@property(strong,nonatomic)FirstPageDataModel *firstpagedatamodle;
@property(strong,nonatomic)FirstPageTableViewCell *FirstPagecell;
@end

@implementation FirstPageControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self confignavigationBar];
    [self ConfigTableView];
    [self configModel];
    
    
    
}

-(void)confignavigationBar
{
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0/255.f green:199/255.f blue:140/255.f alpha:1];
    UISearchBar *FirstPageSearchbar = [[UISearchBar alloc]initWithFrame:CGRectMake(70, 3, KscreenW-80, 40)];
    FirstPageSearchbar.placeholder = @"搜索职位／公司／商区";
    UILabel *lefttext = [[UILabel alloc]initWithFrame:CGRectMake(10, 3, 45, 40)];
    lefttext.text = @"拉 勾";
    lefttext.font = [UIFont fontWithName:@"Helvetica-Bold" size:19.f];
    lefttext.textColor = [UIColor whiteColor];
    [self.navigationController.navigationBar addSubview:lefttext];
    [self.navigationController.navigationBar addSubview:FirstPageSearchbar];
    FirstPageSearchbar.delegate = self;
}

-(void)ConfigTableView
{
    _BasicTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KscreenW, KscreenH) style:UITableViewStyleGrouped];
    _BasicTableView.delegate = self;
    _BasicTableView.dataSource = self;
    [self.view addSubview:_BasicTableView];
}

-(void)configModel
{
    NSString *FirstPageDataPath = [[NSBundle mainBundle]pathForResource:@"FirstPageData" ofType:@"plist"];
    NSArray *FirstPageDataArray = [NSArray arrayWithContentsOfFile:FirstPageDataPath];
    NSMutableArray *FirstpageArray = [NSMutableArray array];
    for (NSDictionary *dic in FirstPageDataArray) {
        _firstpagedatamodle = [[FirstPageDataModel alloc]initWithDictionary:dic];
        [FirstpageArray addObject:_firstpagedatamodle];
    }
    _FirstPageModelArray = FirstpageArray;
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    return YES;
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    FirstPageSearchBarController *firstPageSearchBarController = [[FirstPageSearchBarController alloc]init];
    UINavigationController *firstPageNavi = [[UINavigationController alloc]initWithRootViewController:firstPageSearchBarController];
    firstPageNavi.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:firstPageNavi animated:YES completion:^{
        
    }];
    
}


#pragma -mark Tableview delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.FirstPageModelArray.count;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    _firstpagedatamodle = _FirstPageModelArray[indexPath.row];
    _FirstPagecell = [tableView dequeueReusableCellWithIdentifier:@"222"];
    if (_FirstPagecell == nil) {
        _FirstPagecell = [[FirstPageTableViewCell alloc]initWithIconName:_firstpagedatamodle.iconname JobName:_firstpagedatamodle.jobname CompanyName:_firstpagedatamodle.companyname AddressAndyear:_firstpagedatamodle.addressandyear ScalNumber:_firstpagedatamodle.scalnumber Salary:_firstpagedatamodle.salary InsueDate:@"5月6号"];
    }
    return _FirstPagecell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailJob *detailjob = [[DetailJob alloc]init];
    _firstpagedatamodle = _FirstPageModelArray[indexPath.row];
    UINavigationController *DetailJobNavi = [[UINavigationController alloc]initWithRootViewController:detailjob];
    [self presentViewController:DetailJobNavi animated:YES completion:^{
    }];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}










@end
