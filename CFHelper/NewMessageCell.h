//
//  NewMessageCell.h
//  CFHelper
//
//  Created by qianfeng on 15/9/16.
//  Copyright (c) 2015年 丁晓雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewMessageCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *playImageView;
@property (strong, nonatomic) IBOutlet UIImageView *pic_urlImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descLabel;
@property (strong, nonatomic) IBOutlet UILabel *publishedLabel;

@end
