//
//  NewsModel.h
//  CFHelper
//
//  Created by qianfeng on 15/9/16.
//  Copyright (c) 2015年 丁晓雷. All rights reserved.
//

#import "DXLModel.h"

@interface NewsModel : DXLModel

@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *desc;
@property(nonatomic,copy)NSString *video_url;
@property(nonatomic,copy)NSString *published;
@property(nonatomic,copy)NSString *pic_url;
/*
 "data": [
 {
 "id": "20897",
 "title": "夏佐：佐大队长单挑双刀侠亚锤",
 "desc": "夏佐解说：佐大队长单挑双刀侠亚锤",
 "video_url": "http://hc26.aipai.com/user/499/3308499/1503113/card/26894509/card.mp4",
 "published": 1442410200,
 "pic_url": "http://pic.zhangyoubao.com/cf/news/20150916/spic20897h55f91157.jpg"
 */

@end
