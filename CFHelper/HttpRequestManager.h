//
//  HttpRequestManager.h
//  LimitFreeProject
//
//  Created by LZXuan on 14-12-29.
//  Copyright (c) 2014年 LZXuan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LZXHttpRequest;
/*
 项目中 往往 会有很多界面 都要进行下载， 或者一个界面 有很多不同的下载，这样我们整个应用程序 会有 很多下载对象，这时我们需要有一个专门来管理这些下载对象的类，  这个类可以被多个界面进行访问，我们可以使用单例设计模式来设计， 当下载的时候我们可以把下载对象添加到 管理中，下载完成/或者失败 可以从这个管理类删除
 */
@interface HttpRequestManager : NSObject
//非标准的单例模式
+ (HttpRequestManager *)defaultHttpRequestManager;

//增加一个一个下载任务 把 代理 和 行为传入
- (void)addTask:(NSString *)urlString target:(id)target action:(SEL)action;

//删除任务
- (void)removeTaskFormUrl:(NSString *)url;

//获取下载任务
- (LZXHttpRequest *)requestUrl:(NSString *)url;


//停止任务
- (void)stopTask:(NSString *)url;
//停止所有的下载任务
- (void)stopAllTask:(NSArray *) urlArr;
@end






