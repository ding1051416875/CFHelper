//
//  HttpRequestManager.m
//  LimitFreeProject
//
//  Created by LZXuan on 14-12-29.
//  Copyright (c) 2014年 LZXuan. All rights reserved.
//

#import "HttpRequestManager.h"

#import "LZXHttpRequest.h"


@implementation HttpRequestManager
{
    //保存下载任务的字典  一个 url 对应 一个下载请求对象地址
    NSMutableDictionary *_taskDict;
}
+ (HttpRequestManager *)defaultHttpRequestManager {
    static HttpRequestManager *manager = nil;
    @synchronized(self) {
        if (manager == nil) {
            manager = [[self alloc] init];
        }
    }
    return manager;
}
- (id)init {
    if (self = [super init]) {
        _taskDict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

//增加一个一个下载任务
- (void)addTask:(NSString *)urlString  target:(id)target action:(SEL)action{
    //先检测有没有这个任务
    LZXHttpRequest * httpRequest = [self requestUrl:urlString];
    if (httpRequest) {//返回的不是nil 说明任务存在
        //NSLog(@"当前任务已经存在%@",[self class]);
        return;
    }
    //不存在这个任务那么创建新的
    httpRequest = [[LZXHttpRequest alloc] init];
    
    [httpRequest downloadDataFromUrlString:urlString target:target action:action];
    //放入字典中
    [_taskDict setObject:httpRequest forKey:urlString];
    //下面可以release了
    [httpRequest release];
}

//删除任务
- (void)removeTaskFormUrl:(NSString *)url {
    //实际上就是从字典中删除
    [_taskDict removeObjectForKey:url];
}

//获取下载任务
- (LZXHttpRequest *)requestUrl:(NSString *)url {
    return [_taskDict objectForKey:url];
}


//停止任务
- (void)stopTask:(NSString *)url {
    //获取下载请求对象
    LZXHttpRequest *httpRequest = _taskDict[url];
    if (httpRequest) {
        //停止 下载
        [httpRequest stop];
        //NSLog(@"终止任务");
        //从字典中删除任务
        [self removeTaskFormUrl:url];
    }
    
}
//停止所有的下载任务
- (void)stopAllTask:(NSArray *) urlArr {
    for (NSString  *requestStr in urlArr) {
        //停止一个下载任务
        [self stopTask:requestStr];
    }
}






@end
