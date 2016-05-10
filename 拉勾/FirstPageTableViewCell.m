//
//  FirstPageTableViewCell.m
//  拉勾
//
//  Created by Steven on 16/5/5.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import "FirstPageTableViewCell.h"
#define  KscreenW     [UIScreen mainScreen].bounds.size.width


@implementation FirstPageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithIconName:(NSString *)iconname JobName:(NSString *)jobname CompanyName:(NSString *)companyname AddressAndyear:(NSString *)addressandyear ScalNumber:(NSString *)scalnumber Salary:(NSString *)salary InsueDate:(NSString *)insuedate
{
    if (self = [super init]) {
        _IconNameimage = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 50, 50)];
        //_IconNameimage.backgroundColor = [UIColor redColor];
        _IconNameimage.image = [UIImage imageNamed:iconname];
        [self addSubview:_IconNameimage];
        _JobNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 5, 200, 20)];
        _JobNameLabel.text = jobname;
        _JobNameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];
        //_JobNameLabel.backgroundColor = [UIColor redColor];
        [self addSubview:_JobNameLabel];
        _CompanyNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 28, 200, 15)];
        _CompanyNameLabel.font = [UIFont systemFontOfSize:11];
        //_CompanyNameLabel.backgroundColor = [UIColor greenColor];
        _CompanyNameLabel.text = companyname;
        [self addSubview:_CompanyNameLabel];
        _AddressAndyearLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 46, 200, 15)];
        _AddressAndyearLabel.text = addressandyear;
        _AddressAndyearLabel.font = [UIFont systemFontOfSize:11];
        _AddressAndyearLabel.textColor = [UIColor lightGrayColor];
        //_AddressAndyearLabel.backgroundColor = [UIColor blueColor];
        [self addSubview:_AddressAndyearLabel];
        _ScalNumberLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 64, 300, 15)];
        _ScalNumberLabel.text = scalnumber;
        _ScalNumberLabel.font = [UIFont systemFontOfSize:11];
        _ScalNumberLabel.textColor = [UIColor lightGrayColor];
        //_ScalNumberLabel.backgroundColor = [UIColor orangeColor];
        [self addSubview:_ScalNumberLabel];
        _SalaryLabel = [[UILabel alloc]initWithFrame:CGRectMake(268, 5, KscreenW-276, 20)];
        _SalaryLabel.text = salary;
        _SalaryLabel.font = [UIFont systemFontOfSize:13];
        _SalaryLabel.textColor = [UIColor orangeColor];
        _SalaryLabel.textAlignment = NSTextAlignmentRight;
        //_SalaryLabel.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_SalaryLabel];
        _InsueDateLabel = [[UILabel alloc]initWithFrame:CGRectMake(268, 46, KscreenW-276, 15)];
        _InsueDateLabel.text = insuedate;
        _InsueDateLabel.font = [UIFont systemFontOfSize:10];
        _InsueDateLabel.textAlignment = NSTextAlignmentRight;
        _InsueDateLabel.textColor = [UIColor lightGrayColor];
        
        //_InsueDateLabel.backgroundColor = [UIColor purpleColor];
        [self addSubview:_InsueDateLabel];
    }
    return self;
}
@end
