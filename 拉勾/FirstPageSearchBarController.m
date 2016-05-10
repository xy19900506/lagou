//
//  FirstPageSearchBarController.m
//  拉勾
//
//  Created by Steven on 16/4/21.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import "FirstPageSearchBarController.h"
#import "CityViewController.h"
#import "SelectCityView.h"
#import "SearchInfoController.h"
#import "FirstPageTableHeadView.h"

@interface FirstPageSearchBarController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UISearchBar            *searchMessage;
@property(nonatomic,strong)NSString               *cityName;
@property(nonatomic,strong)UIBarButtonItem        *leftItem;
@property(nonatomic,strong)CityViewController     *cityController;
@property(nonatomic,strong)NSString               *leftbtnTitle;
@property(nonatomic,strong)UINavigationController *cityNavi;
@property(nonatomic,strong)NSMutableArray         *CellInfoMutlArray;
@property(nonatomic,strong)NSArray                *CellInfoArray;
@property(nonatomic,strong)UITableView            *FirstLoadTable;
@property(nonatomic,strong)UITableView            *TextChangeTable;
@property(nonatomic,strong)SearchInfoController   *searchInfoController;
@property(nonatomic,strong)NSArray                *SearchInfoArray;
@property(nonatomic,assign)BOOL                   isSearch;
@property(nonatomic,strong)NSArray                *searchDataArray;
@property(nonatomic,strong)NSArray                *headViewArray;
@property(nonatomic,assign)BOOL                   FootViewBtnIsClick;
@property(nonatomic,assign)BOOL                   FootViewBtnIshiden;
@property(nonatomic,strong)NSUserDefaults         *userdefaults;
@end
@implementation FirstPageSearchBarController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self confignavigationbar];
    [self cinfigTableview];
}

-(void)confignavigationbar
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeCityname:) name:@"CityName" object:nil];
    self.view.backgroundColor = [UIColor whiteColor];
    _searchMessage = [[UISearchBar alloc]initWithFrame:CGRectMake(70, 3, [UIScreen mainScreen].bounds.size.width-120, 40)];
    _searchMessage.delegate = self;
    _searchMessage.placeholder = @"搜索职位／公司／商区";
    _isSearch = NO;
    [self.navigationController.navigationBar addSubview:_searchMessage];
    _leftbtnTitle = [[NSUserDefaults standardUserDefaults]objectForKey:@"leftbtntitle"];
    if (_leftbtnTitle == nil) {
        _leftbtnTitle = @"北京";
    }
    _leftItem = [[UIBarButtonItem alloc]initWithTitle:_leftbtnTitle style:UIBarButtonItemStylePlain target:self action:@selector(selectcity)];
    self.navigationItem.leftBarButtonItem = _leftItem;
    _leftItem.tintColor = [UIColor colorWithRed:41/255.f green:36/255.f blue:33/255.f alpha:1];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(dismisviewcontroller)];
    self.navigationItem.rightBarButtonItem = rightItem;
    rightItem.tintColor = [UIColor colorWithRed:41/255.f green:36/255.f blue:33/255.f alpha:1];
    self.navigationController.navigationBar.barTintColor = [UIColor groupTableViewBackgroundColor];
    [_searchMessage becomeFirstResponder];
    _CellInfoMutlArray = [[NSMutableArray alloc]init];
    _userdefaults = [NSUserDefaults standardUserDefaults];
    _FootViewBtnIshiden = NO;
    _searchInfoController = [[SearchInfoController alloc]init];
    if ([_userdefaults objectForKey:@"CellInfoArray"])
    {
        _CellInfoArray = [_userdefaults objectForKey:@"CellInfoArray"];
        NSLog(@"%ld",_CellInfoArray.count);
    }
    if ([_userdefaults boolForKey:@"_FootViewBtnIshiden"]) {
        _FootViewBtnIshiden = [_userdefaults boolForKey:@"_FootViewBtnIshiden"];
    }
}

-(void)changeCityname:(NSNotification *)notification
{
    NSDictionary *citynameInfo = [notification userInfo];
    _leftbtnTitle = [citynameInfo objectForKey:@"titletext"];
    [_leftItem setTitle:_leftbtnTitle];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:_leftbtnTitle forKey:@"leftbtntitle"];
}

-(void)dismisviewcontroller
{
    [_searchMessage resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

-(void)selectcity
{
    self.hidesBottomBarWhenPushed = YES;
    CityViewController *cityController = [[CityViewController alloc]init];
    _cityNavi = [[UINavigationController alloc]initWithRootViewController:cityController];
    _cityNavi.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:_cityNavi animated:YES completion:^{
    }];
    self.hidesBottomBarWhenPushed = NO;
}

-(void)cinfigTableview
{
    _TextChangeTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width-64) style:UITableViewStyleGrouped];
    [self.view addSubview:_TextChangeTable];
    _TextChangeTable.delegate = self;
    _TextChangeTable.dataSource = self;
    _FirstLoadTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64) style:UITableViewStyleGrouped];
    _FirstLoadTable.delegate = self;
    _FirstLoadTable.dataSource = self;
    [self.view addSubview:_FirstLoadTable];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    _FirstLoadTable.showsHorizontalScrollIndicator = NO;
    _FirstLoadTable.scrollEnabled = NO;
    _FirstLoadTable.userInteractionEnabled = YES;
    FirstPageTableHeadView *headview = [[FirstPageTableHeadView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100) Titlearray:self.headViewArray];
    for ( id btn in headview.subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
           [btn addTarget:self action:@selector(headviewbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    _FirstLoadTable.tableHeaderView = headview;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyBoard)];
    tapGesture.cancelsTouchesInView = NO;
    //[[UITapGestureRecognizer alloc] initWithTarget:selfaction:@selector(dismissKeyBoard)];
    [_FirstLoadTable addGestureRecognizer:tapGesture];
 
}

-(IBAction)headviewbuttonClick:(UIButton *)sender
{
    NSLog(@"%@",sender.titleLabel.text);
    _searchInfoController = [[SearchInfoController alloc]init];
    [_searchMessage resignFirstResponder];
    _searchMessage.text = sender.titleLabel.text;
    if ([_CellInfoMutlArray containsObject:sender.titleLabel.text]) {
        [self.navigationController pushViewController:_searchInfoController animated:YES];
        return;
    }
    else
    {
        [_CellInfoMutlArray addObject:sender.titleLabel.text];
        _CellInfoArray = [NSArray arrayWithArray:_CellInfoMutlArray];
        [_userdefaults setObject:_CellInfoArray forKey:@"CellInfoArray"];
        [_userdefaults synchronize];
        [self.navigationController pushViewController:_searchInfoController animated:YES];
    }
    
    
    
    
}
-(void)dismissKeyBoard
{
    [UIView animateWithDuration:0.5 animations:^{
        [_searchMessage resignFirstResponder];
    }];
    
}

-(IBAction)ClickFootViewBtn:(UIButton *)sender
{
    [_CellInfoMutlArray removeAllObjects];
    _CellInfoArray = nil;
    [_userdefaults setObject:_CellInfoArray forKey:@"CellInfoArray"];
    [_FirstLoadTable reloadData];
    
}

-(NSArray *)SearchInfoArray
{
    if (_SearchInfoArray == nil) {
        _SearchInfoArray = @[@"Android",@"BigBoon",@"Bagage",@"C语言",@"C ++",@"C #",@"data",@"debate",@"deer",@"拉勾网",@"智联招聘",@"笔记本电脑",@"手机客户端",@"iOS",@"《清风徐来》",@"周杰伦",@"排球比赛",@"NBA",@"面朝大海，春暖花开",@"微风阵阵"];
    }
    return _SearchInfoArray;
}

-(NSArray *)headViewArray
{
    if (_headViewArray == nil) {
        _headViewArray = @[@"BigBoon",@"清风徐来",@"C语言",@"微风阵阵",@"Android",@"deer",@"Bagage",@"C ++",@"debate"];
    }
    return _headViewArray;
}
-(void)filterBysubString:(NSString *)substr
{
    _isSearch = YES;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@",substr];
    _searchDataArray = [_SearchInfoArray filteredArrayUsingPredicate:predicate];
    [_TextChangeTable reloadData];
}

#pragma UISearchBar Delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    if ([_CellInfoMutlArray containsObject:searchBar.text]) {
        [searchBar resignFirstResponder];
        _searchInfoController = [[SearchInfoController alloc]init];
        [self.navigationController pushViewController:_searchInfoController animated:YES];
        return;
    }
    else
    {
        [_CellInfoMutlArray addObject:searchBar.text];
        _CellInfoArray = [NSArray arrayWithArray:_CellInfoMutlArray];
        [_userdefaults setObject:_CellInfoArray forKey:@"CellInfoArray"];
        [_userdefaults synchronize];
        [searchBar resignFirstResponder];
        _searchInfoController = [[SearchInfoController alloc]init];
        [self.navigationController pushViewController:_searchInfoController animated:YES];
    }
    
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self.view bringSubviewToFront:_TextChangeTable];
    [self filterBysubString:searchText];
    if ([searchBar.text isEqualToString:@""]) {
        [self.view bringSubviewToFront:_FirstLoadTable];
    }
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [self.navigationController popViewControllerAnimated:YES];
    [_FirstLoadTable reloadData];
}

#pragma Tableview delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _FirstLoadTable) {
        if (_CellInfoArray.count <= 3)
        {
            return self.CellInfoArray.count;
        }
        else
            return 3;
        
    }
    else
    {
        if (_isSearch) {
            return self.searchDataArray.count;
        }
        else
            return self.SearchInfoArray.count;
    }
    
        
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    if (tableView == _FirstLoadTable) {
        UITableViewCell *cell = [_FirstLoadTable dequeueReusableCellWithIdentifier:@"111"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"123"];
        }
        if (_CellInfoArray.count >= 3)
        {
            
            if (indexPath.row ==0) {
                cell.textLabel.text = _CellInfoArray[_CellInfoArray.count-1];
            }
            else if (indexPath.row == 1)
            {
                cell.textLabel.text = _CellInfoArray[_CellInfoArray.count-2];
            }
            else
                cell.textLabel.text = _CellInfoArray[_CellInfoArray.count-3];
        }
        else
        {
            if (_CellInfoArray.count == 2) {
                if (indexPath.row == 0) {
                    cell.textLabel.text = _CellInfoArray[1];
                }
                if (indexPath.row == 1) {
                    cell.textLabel.text = _CellInfoArray[0];
                }
                
            }
            if (_CellInfoArray.count == 1) {
                cell.textLabel.text = _CellInfoArray[0];
            }
        }
        
        return cell;

    }
    else
    {
        UITableViewCell *cell = [_TextChangeTable dequeueReusableCellWithIdentifier:@"222"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"333"];
            if (_isSearch) {
                cell.textLabel.text = self.searchDataArray[indexPath.row];
            }
            else
                cell.textLabel.text = self.SearchInfoArray[indexPath.row];
        }
        return cell;
    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_searchMessage resignFirstResponder];
    [self.navigationController pushViewController:_searchInfoController animated:YES];
    if (tableView == _FirstLoadTable) {
        if (_CellInfoArray.count >= 3)
        {
            
            if (indexPath.row ==0) {
                _searchMessage.text = _CellInfoArray[_CellInfoArray.count-1];
            }
            else if (indexPath.row == 1)
            {
                _searchMessage.text = _CellInfoArray[_CellInfoArray.count-2];
            }
            else
                _searchMessage.text = _CellInfoArray[_CellInfoArray.count-3];
        }
        else
        {
            if (_CellInfoArray.count == 2) {
                if (indexPath.row == 0) {
                    _searchMessage.text = _CellInfoArray[1];
                }
                if (indexPath.row == 1) {
                    _searchMessage.text = _CellInfoArray[0];
                }
                
            }
            if (_CellInfoArray.count == 1) {
                _searchMessage.text = _CellInfoArray[0];
            }
        }
        //_searchMessage.text = _CellInfoArray[indexPath.row];
    }
    if (tableView == _TextChangeTable) {
        _searchMessage.text = _searchDataArray[indexPath.row];
        NSString *res = _searchDataArray[indexPath.row];
        [_CellInfoMutlArray addObject:res];
        _CellInfoArray  = [NSArray arrayWithArray:_CellInfoMutlArray];
        [_userdefaults setObject:_CellInfoArray forKey:@"CellInfoArray"];
        [_userdefaults synchronize];
        
    }
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (tableView == _FirstLoadTable) {
        return 44;
    }
    else
        return 0.001;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (tableView == _FirstLoadTable) {
        if (_CellInfoArray.count != 0) {
            UIView *footview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
            UIButton *cleanBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
            cleanBtn.backgroundColor = [UIColor whiteColor];
            [cleanBtn setTitle:@"清除记录" forState:UIControlStateNormal];
            [cleanBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            cleanBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            [cleanBtn addTarget:self action:@selector(ClickFootViewBtn:) forControlEvents:UIControlEventTouchUpInside];
            [footview addSubview:cleanBtn];
            return footview;
        }
        else
            return 0;
        
    }
    else
        return 0;
   
}
@end
