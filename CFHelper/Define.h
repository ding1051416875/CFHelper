
//
//  Define.h
//  CFHelper
//
//  Created by qianfeng on 15/9/15.
//  Copyright (c) 2015年 丁晓雷. All rights reserved.
//

#ifndef CFHelper_Define_h
#define CFHelper_Define_h

#define ScreenSize [[UIScreen mainScreen] bounds].size
#import "UIImageView+WebCache.h"
#import "LZXHelper.h"
#import "MMProgressHUD+Animations.h"
#import "HttpRequestManager.h"
#import "MyControl.h"
#import "JHRefresh.h"
#import <AFNetworking.h>
#import "MJRefresh.h"

#import <MediaPlayer/MediaPlayer.h>
#define  kScreen [UIScreen mainScreen].bounds.size
//CF
//最新
#define New_URL @"http://cf.zhangyoubao.com/apis/rest/ItemsService/lists?&cattype=news&catid=10002&page=%ld&i_=862073025981253&t_=1442301123202&p_=11951&v_=30216&a_=cf&pkg_=com.anzogame.cf&d_=android&osv_=17&u_=&version=0"

//滚动视图
//http://cf.zhangyoubao.com/apis/rest/ItemsService/ads?&i_=862073025981253&t_=1442301170519&p_=3902&v_=30216&a_=cf&pkg_=com.anzogame.cf&d_=android&osv_=17&u_=&version=0

//资讯
#define ZiXun_URL  @"http://cf.zhangyoubao.com/apis/rest/ItemsService/lists?&cattype=news&catid=10000&page=%ld&i_=862073025981253&t_=1442302021153&p_=5804&v_=30216&a_=cf&pkg_=com.anzogame.cf&d_=android&osv_=17&u_=&version=0"

//活动
#define Action_URL @"http://cf.zhangyoubao.com/apis/rest/ItemsService/lists?&cattype=news&catid=10008&page=%ld&i_=862073025981253&t_=1442302140371&p_=3458&v_=30216&a_=cf&pkg_=com.anzogame.cf&d_=android&osv_=17&u_=&version=0"

//娱乐
#define Fun_URL @"http://cf.zhangyoubao.com/apis/rest/ItemsService/lists?&cattype=news&catid=10027&page=%ld&i_=862073025981253&t_=1442302179361&p_=30428&v_=30216&a_=cf&pkg_=com.anzogame.cf&d_=android&osv_=17&u_=&version=0"

//攻略
#define War_URL @"http://cf.zhangyoubao.com/apis/rest/ItemsService/lists?&cattype=news&catid=10026&page=%ld&i_=862073025981253&t_=1442302247750&p_=25595&v_=30216&a_=cf&pkg_=com.anzogame.cf&d_=android&osv_=17&u_=&version=0"

//视频详情
#define Videl_detail @"http://cf.zhangyoubao.com/mobiles/item/%@?v_=30216&dw=360"

//游戏视频
//最热
//http://cf.zhangyoubao.com/apis/rest/ItemsService/hotVideos?&page=1&i_=862073025981253&t_=1442302579028&p_=29429&v_=30216&a_=cf&pkg_=com.anzogame.cf&d_=android&osv_=17&u_=&version=0
//
//最新
#define Video_ZuiXin @"http://cf.zhangyoubao.com/apis/rest/ItemsService/latestVideos?&page=%ld&i_=862073025981253&t_=1442302578954&p_=29207&v_=30216&a_=cf&pkg_=com.anzogame.cf&d_=android&osv_=17&u_=&version=0"
//
//真人秀
//http://cf.zhangyoubao.com/apis/rest/UgcsService/getUserShows?&page_session=1442297400&page=3&area=&sex=&order_kind=0&i_=862073025981253&t_=1442302716644&p_=22277&v_=30216&a_=cf&pkg_=com.anzogame.cf&d_=android&osv_=17&u_=&version=0
//
//武器评测
//http://cf.zhangyoubao.com/apis/rest/ItemsService/lists?&cattype=assess&catid=0&i_=862073025981253&t_=1442302946186&p_=20903&v_=30216&a_=cf&pkg_=com.anzogame.cf&d_=android&osv_=17&u_=&version=0
//
//详情界面
//http://cf.zhangyoubao.com/mobiles/item/20522?v_=30216&dw=360
//id= 20522


#endif
