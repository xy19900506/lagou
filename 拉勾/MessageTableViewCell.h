//
//  MessageTableViewCell.h
//  拉勾
//
//  Created by Steven on 16/4/21.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel *NameLabel;
@property(nonatomic,strong)UILabel *detaielLabel;
@property(nonatomic,strong)UIImageView *imageview;

-(instancetype)initWithImage:(NSString *)image WithName:(NSString *)name WithDetail:(NSString *)detaiel;
@end
