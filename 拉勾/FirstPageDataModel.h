//
//  FirstPageDataModel.h
//  拉勾
//
//  Created by Steven on 16/5/5.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FirstPageDataModel : NSObject
@property(nonatomic,strong)NSString *iconname;
@property(nonatomic,strong)NSString *jobname;
@property(nonatomic,strong)NSString *companyname;
@property(nonatomic,strong)NSString *addressandyear;
@property(nonatomic,strong)NSString *salary;
@property(nonatomic,strong)NSString *insuedate;
@property(nonatomic,strong)NSString *scalnumber;
-(instancetype)initWithDictionary:(NSDictionary *)dict;
@end
