//
//  LZXHttpRequest.h
//  SNSDemo&封装下载对象
//
//  Created by LZXuan on 14-12-18.
//  Copyright (c) 2014年 LZXuan. All rights reserved.
//

#import <Foundation/Foundation.h>

//实现 LZXHttpRequest 具备下载 数据的功能
@interface LZXHttpRequest : NSObject <NSURLConnectionDataDelegate>
{
    //下载请求连接
    NSURLConnection *_httpRequest;
    //保存下载数据
    NSMutableData *_downloadData;
}
//获取下载数据
@property (nonatomic,retain) NSMutableData *downloadData;

//弱引用  assign  arc 用weak
@property(nonatomic,assign) id target;
@property (nonatomic,assign) SEL action;
//当前下载的请求的url
@property(nonatomic,strong) NSString *requestUrlString;

//记录是否下载成功
@property (nonatomic,assign) BOOL isDownloadSuccess;
//记录错误
@property (nonatomic,retain) NSError *error;


//根据url 下载数据
- (void)downloadDataFromUrlString:(NSString *)urlString target:(id)target action:(SEL)action;

//对外提供一个方法 停止下载任务
- (void)stop;
@end




