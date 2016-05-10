//
//  FirstPageTableViewCell.h
//  拉勾
//
//  Created by Steven on 16/5/5.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstPageTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *IconNameimage;
@property(nonatomic,strong)UILabel     *JobNameLabel;
@property(nonatomic,strong)UILabel     *CompanyNameLabel;
@property(nonatomic,strong)UILabel     *AddressAndyearLabel;
@property(nonatomic,strong)UILabel     *ScalNumberLabel;
@property(nonatomic,strong)UILabel     *SalaryLabel;
@property(nonatomic,strong)UILabel     *InsueDateLabel;
@property(nonatomic,assign)CGFloat     cellHeight;

-(instancetype)initWithIconName:(NSString *)iconname
                        JobName:(NSString *)jobname
                    CompanyName:(NSString *)companyname
                 AddressAndyear:(NSString *)addressandyear
                     ScalNumber:(NSString *)scalnumber
                         Salary:(NSString *)salary
                      InsueDate:(NSString *)insuedate;
@end
