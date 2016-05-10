//
//  MetableViewCells.h
//  拉勾
//
//  Created by Steven on 16/4/24.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MetableViewCells : UITableViewCell
@property(nonatomic,strong)UIImageView *IconImageView;
@property(nonatomic,strong)UILabel *InfoLabel;
@property(nonatomic,strong)UILabel *Detail;

-(instancetype)initWithImage:(UIImage *)image info:(NSString *)information Detail:(NSString *)detail;
@end
