//
//  FirstPageDataModel.m
//  拉勾
//
//  Created by Steven on 16/5/5.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import "FirstPageDataModel.h"

@implementation FirstPageDataModel
-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        _iconname       = dict[@"IconName"];
        _jobname        = dict[@"JobName"];
        _companyname    = dict[@"CompanyName"];
        _salary         = dict[@"Salary"];
        _scalnumber     = dict[@"ScaleNumber"];
        _addressandyear = dict[@"AddressAndYear"];
        _insuedate      = dict[@"InsueDate"];
        
    }
    return self;
}
@end
