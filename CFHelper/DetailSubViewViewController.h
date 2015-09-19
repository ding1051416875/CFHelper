//
//  DetailSubViewViewController.h
//  CFHelper
//
//  Created by qianfeng on 15/9/16.
//  Copyright (c) 2015年 丁晓雷. All rights reserved.
//

#import "BaseViewController.h"
#import "NewsModel.h"
#import "VideoModel.h"
@interface DetailSubViewViewController : BaseViewController
@property(nonatomic,copy)NSString *subUrl;
@property(nonatomic,copy)NSString *videoUrl;
@property(nonatomic,copy)NSString *nameUrl;
@end
