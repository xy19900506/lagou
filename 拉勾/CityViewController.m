//
//  CityViewController.m
//  拉勾
//
//  Created by Steven on 16/4/24.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import "CityViewController.h"
#import "SelectCityView.h"
#import "SelectCityTableViewCell.h"

@interface CityViewController ()<SelectCityDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *cityTableView;
@property(nonatomic,strong)SelectCityView *selectcityView;
@property(nonatomic,strong)SelectCityView *selectcityView1;
@property(nonatomic,strong)SelectCityView *selectcityView2;
@property(nonatomic,strong)SelectCityView *selectcityView3;
@property(nonatomic,strong)SelectCityView *selectcityView4;
@property(nonatomic,strong)SelectCityView *selectcityView5;
@property(nonatomic,strong)SelectCityView *selectcityView6;
@property(nonatomic,strong)NSArray *array;
@end
@implementation CityViewController


-(void)viewDidLoad
{

    [super viewDidLoad];
    [self configBaseView];
    
   
}

-(void)configBaseView
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"选择城市";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"login_finish_pre"] style:UIBarButtonItemStylePlain target:self action:@selector(dismiscontroller)];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor lightGrayColor];
    [self selectcity];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self configCityTableview];
}

-(void)configCityTableview
{
    _cityTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStyleGrouped];
    [self.view addSubview:_cityTableView];
    _cityTableView.delegate = self;
    _cityTableView.dataSource = self;
    
    
}

-(void)dismiscontroller
{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
    
}
-(void)selectcity
{
    NSArray *titlearray = @[@"全国",@"北京",@"上海",@"深圳",@"广州",@"杭州",@"成都",@"南京",@"武汉",@"西安",@"厦门",@"长沙",@"苏州",@"天津"];
    _selectcityView = [[SelectCityView alloc]initWithTitleArray:titlearray];
    _selectcityView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, _selectcityView.selfFrame.size.height);
    _selectcityView.cityDelegate = self;
    
    NSArray *titlearray1 = @[@"鞍山",@"蚌埠",@"保定",@"北京",@"长春",@"成都",@"重庆",@"长沙",@"常熟",@"朝阳",@"常州",@"东莞",@"大连",@"东营",@"德州",@"佛山",@"福州"];
    _selectcityView1  = [[SelectCityView alloc]initWithTitleArray:titlearray1];
    _selectcityView1.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, _selectcityView1.selfFrame.size.height);
    _selectcityView1.cityDelegate = self;
    
    NSArray *titlearray2 = @[@"桂林",@"贵阳",@"广州",@"哈尔滨",@"合肥",@"呼和浩的",@"海口",@"杭州",@"惠州",@"湖州",@"金华",@"江门",@"济南",@"济宁",@"嘉兴",@"江阴"];
    _selectcityView2 = [[SelectCityView alloc]initWithTitleArray:titlearray2];
    _selectcityView2.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, _selectcityView2.selfFrame.size.height);
    _selectcityView2.cityDelegate = self;
    
    NSArray *titlearray3 = @[@"昆明",@"昆山",@"聊城",@"廊坊",@"丽水",@"洛阳",@"临沂",@"龙岩",@"连云港",@"兰州",@"杭州",@"绵阳",@"宁波",@"南昌",@"南京",@"南宁",@"南通"];
    _selectcityView3 = [[SelectCityView alloc]initWithTitleArray:titlearray3];
    _selectcityView3.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, _selectcityView3.selfFrame.size.height);
    _selectcityView3.cityDelegate = self;
    
    NSArray *titlearray4 = @[@"青岛",@"秦皇岛",@"泉州",@"日照"];
    _selectcityView4 = [[SelectCityView alloc]initWithTitleArray:titlearray4];
    _selectcityView4.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, _selectcityView3.selfFrame.size.height);
    _selectcityView4.cityDelegate = self;
    
    NSArray *titlearray5 = @[@"上海",@"石家庄",@"汕头",@"绍兴",@"沈阳",@"三亚",@"深圳",@"苏州",@"天津",@"唐山",@"太原",@"台州"];
    _selectcityView5 = [[SelectCityView alloc]initWithTitleArray:titlearray5];
    _selectcityView5.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, _selectcityView5.selfFrame.size.height);
    _selectcityView5.cityDelegate = self;
    
    NSArray *titlearray6 = @[@"潍坊",@"武汉",@"芜湖",@"威海",@"乌鲁木齐",@"无锡",@"温州",@"西安",@"香港",@"厦门",@"西宁",@"邢台",@"徐州",@"银川",@"盐城",@"烟台",@"扬州",@"珠海",@"张家口",@"肇兴",@"中山",@"郑州"];
    _selectcityView6 = [[SelectCityView alloc]initWithTitleArray:titlearray6];
    _selectcityView6.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, _selectcityView6.selfFrame.size.height);
    _selectcityView6.cityDelegate = self;
    _array = @[_selectcityView,_selectcityView1,_selectcityView2,_selectcityView3,_selectcityView4,_selectcityView5,_selectcityView6];
    
    
}

-(void)DismisControllerWhenClickBtn:(NSString *)titletext
{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CityName" object:nil userInfo:@{@"titletext":titletext}];
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

#pragma -mark CityTableview Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *CellIdentifier = @"Cell";
    SelectCityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[SelectCityTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell" withView:_array[indexPath.section]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 7;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return _selectcityView.selfFrame.size.height;
            break;
        case 1:
            return _selectcityView1.selfFrame.size.height;
            break;
        case 2:
            return _selectcityView2.selfFrame.size.height;
            break;
        case 3:
            return _selectcityView3.selfFrame.size.height;
            break;
        case 4:
            return _selectcityView4.selfFrame.size.height;
            break;
        case 5:
            return _selectcityView5.selfFrame.size.height;
            break;
        default:
            return _selectcityView6.selfFrame.size.height;
            break;
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 20;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 200, 20)];
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 24)];
    lab.font = [UIFont systemFontOfSize:13];
    lab.textColor = [UIColor lightGrayColor];
    NSArray *titleArray = @[@"热门城市",@"ABCDEF",@"GHIJ",@"KLMN",@"OPQR",@"STUV",@"WXYZ"];
    [view1 addSubview:lab];
    lab.text = titleArray[section];
    return view1;
    
}


@end
