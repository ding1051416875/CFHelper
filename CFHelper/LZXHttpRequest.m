//
//  LZXHttpRequest.m
//  SNSDemo&封装下载对象
//
//  Created by LZXuan on 14-12-18.
//  Copyright (c) 2014年 LZXuan. All rights reserved.
//

#import "LZXHttpRequest.h"
#import "HttpRequestManager.h"
#import "MMProgressHUD.h"


@implementation LZXHttpRequest
@synthesize target = _target;
@synthesize action = _action;
@synthesize downloadData = _downloadData;


- (void)dealloc {
    self.requestUrlString = nil;
    self.error = nil;
    
    self.downloadData = nil;
    [_httpRequest cancel];//取消下载
    [_httpRequest release];
    
    [super dealloc];
}
- (id)init {
    if (self = [super init]) {
        _downloadData = [[NSMutableData alloc] init];
    }
    return self;
}
//下载数据 创建 下载请求连接
- (void)downloadDataFromUrlString:(NSString *)urlString  target:(id)target action:(SEL)action{
    if (_httpRequest) {
        //判断当前下载对象有没有 下载 如果有 那么取消 上一次的
        [_httpRequest cancel];
        
        [_httpRequest release];//arc 下面 不用写release
        _httpRequest = nil;
    }
    //保存
    self.target = target;
    self.action = action;
    self.requestUrlString = urlString;
    
    
    //下载请求 地址
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    //创建下载请求连接
    _httpRequest = [[NSURLConnection alloc] initWithRequest:request delegate:self];

    //加上 下载 进入特效
    //开始下载的时候加入 特效
    //1.设置特效风格
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleDrop];
    //2.开始下载的标题和内容
    [MMProgressHUD showWithTitle:nil status:@"正在努力的下载中"];
    
}

#pragma mark -  NSURLConnectionDataDelegate
//客户端接收 服务端的响应 调用
//发数据之前的响应
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    //清空 downloadData
    [self.downloadData setLength:0];
}

//接收下载数据调用
//一段一段 发数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    //拼接
    [self.downloadData appendData:data];
}
//下载完成调用
/*
 这时当前类的对象已经具备了下载数据的能力，但是下载完成之后 不知道如何处理数据
 需要  委托 代理来处理数据
 //一旦 下载完成当前对象 可以通知代理
 
 */
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [MMProgressHUD dismissWithSuccess:@"下载完成" title:nil];
    self.isDownloadSuccess = YES;
    //下载完成之后 从管理类中删除任务
    [[HttpRequestManager defaultHttpRequestManager] removeTaskFormUrl:self.requestUrlString];
    
    //下载完成 通知 self.target 调用 self.action
    if ([self.target respondsToSelector:self.action]) {
        [self.target performSelector:self.action withObject:self];
    }else {
        NSLog(@"没有实现action对应的方法");
    }
    
}
//请求失败
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"error:%@",error);
    
    [MMProgressHUD dismissWithError:@"下载失败" title:nil];
    //标记下载失败
    self.isDownloadSuccess = NO;
    
    //下载失败 从管理类中删除任务
    [[HttpRequestManager defaultHttpRequestManager] removeTaskFormUrl:self.requestUrlString];
    if ([self.target respondsToSelector:self.action]) {
        self.error = error;
        [self.target performSelector:self.action withObject:self];
    }
}

- (void)stop {
    
    if (_httpRequest) {
        [_httpRequest cancel];//取消下载
        self.target = nil;//置为nil 防止 还没下载完成就把任务停了，如果不置为nil 程序有可能崩溃
        _httpRequest = nil;
    }
}


@end
