//
//  VideoModel.h
//  CFHelper
//
//  Created by qianfeng on 15/9/17.
//  Copyright (c) 2015年 丁晓雷. All rights reserved.
//

#import "DXLModel.h"
@interface VideoModel : DXLModel

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *desc;
@property(nonatomic,copy)NSString *published;
@property(nonatomic,copy)NSString *pic;
@property(nonatomic,copy)NSString *video_url;
@property(nonatomic,copy)NSString *pic_url;
@property(nonatomic,copy)NSString *item_id;
@property(nonatomic,copy)NSString *status;
/*
 {
 "data": [
 {
 "title": "陈子豪激情生化最后一战",
 "desc": "每个人都有他的生活，每天沉迷在网络里，这不是我想走的路，大家愚人节快乐",
 "published": 1427889600,
 "pic": "cf/news/20150401/spic15821h551bb3b0.jpg",
 "video_url": "http://hc24.aipai.com/user/831/325831/258555/card/24952727/card.mp4",
 "status": "1",
 "pic_url": "http://pic.zhangyoubao.com/cf/news/20150401/spic15821h551bb3b0.jpg",
 "item_id": "15821"
 },
 */
@end
