//
//  SelectCityTableViewCell.h
//  拉勾
//
//  Created by Steven on 16/4/24.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectCityView.h"

@interface SelectCityTableViewCell : UITableViewCell
@property(nonatomic,strong)SelectCityView *selectcityview;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withView:(UIView *)view;
@end
