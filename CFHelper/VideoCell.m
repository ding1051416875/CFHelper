//
//  VideoCell.m
//  CFHelper
//
//  Created by qianfeng on 15/9/17.
//  Copyright (c) 2015年 丁晓雷. All rights reserved.
//

#import "VideoCell.h"

@implementation VideoCell

- (void)awakeFromNib {
    // Initialization code
}
//@property(nonatomic,copy)NSString *title;
//@property(nonatomic,copy)NSString *desc;
//@property(nonatomic,copy)NSString *published;
//@property(nonatomic,copy)NSString *pic;
//@property(nonatomic,copy)NSString *video_url;
//@property(nonatomic,copy)NSString *pic_url;
//@property(nonatomic,copy)NSString *item_id;
-(void)showDataWithModel:(VideoModel *)model{
    [self.img sd_setImageWithURL:[NSURL URLWithString:model.pic_url] placeholderImage:[UIImage imageNamed:@""]];
    self.titleLabel.text=model.title;
    self.descLabel.text=model.desc;
    NSString *str = [LZXHelper dateStringFromNumberTimer:model.published];
    NSArray *arr = [str componentsSeparatedByString:@" "];
    NSArray *arrDate = [arr[0] componentsSeparatedByString:@"-"];
    NSString *strDate = [arrDate[1] stringByAppendingFormat:@"-%@",arrDate[2]];
    NSArray *arrD = [arr[1] componentsSeparatedByString:@":"];
    NSString *strD = [arrD[0] stringByAppendingFormat:@":%@",arrD[1]];
    NSString *string = [strDate stringByAppendingFormat:@" %@",strD];
    self.dateLabel.text = string;

   
    
    
     
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
