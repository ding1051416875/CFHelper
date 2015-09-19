//
//  VideoCell.h
//  CFHelper
//
//  Created by qianfeng on 15/9/17.
//  Copyright (c) 2015年 丁晓雷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoModel.h"
@interface VideoCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *img;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
-(void)showDataWithModel:(VideoModel *)model;
@end
