//
//  VideoDetailWebView.m
//  CFHelper
//
//  Created by qianfeng on 15/9/18.
//  Copyright (c) 2015年 丁晓雷. All rights reserved.
//

#import "VideoDetailWebView.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <MediaPlayer/MediaPlayer.h>

@interface VideoDetailWebView ()<UIWebViewDelegate>{
    UIWebView *_webView;
    MPMoviePlayerViewController *_mp;
    UIButton *_button;
    UILabel *_showLabel;
}

@end

@implementation VideoDetailWebView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createWebView];
}

-(void)createWebView{
    _webView=[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreen.width, kScreen.height-44)];
    if (self.subUrl) {
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:self.subUrl]];
        [_webView loadRequest:request];
    }else if(self.nameUrl){
        NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:self.nameUrl]];
        [_webView loadRequest:request];
    }
    
    [self.view addSubview:_webView];
    _button=[MyControl creatButtonWithFrame:CGRectMake(120, 150, 80, 80) target:self sel:@selector(btnClick:) tag:101 image:@"" title:nil];
    if (self.videoUrl == nil) {
        _button.hidden=YES;
    }else{
        _button.hidden=NO;
    }
    [_webView.scrollView addSubview:_button];
    
}
- (void)creatLabel {
    _showLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 60, 200, 20)];
    _showLabel.textColor = [UIColor orangeColor];
    
    [self.view addSubview:_showLabel];
}
-(void)btnClick:(UIButton *)button{
    if (self.videoUrl.length!=0) {
        [UIView animateWithDuration:1 animations:^{
            _showLabel.alpha=1;
        }completion:nil];
    }else{
        [UIView animateWithDuration:2 animations:^{
            _showLabel.alpha=1;
        }completion:nil];
        _showLabel.text=@"暂无视频";
    }
    NSString *webPath=self.videoUrl;
    [self playVideoWithPath:webPath];
    
}
-(void)playVideoWithPath:(NSString *)path{
    if (path.length==0) {
        return;
    }
    NSURL *url;
    BOOL ifSure;
    if ([path hasPrefix:@"http://"]||[path hasPrefix:@"https://"]) {
        url=[NSURL URLWithString:path];
        ifSure=YES;
    }else{
        url=[NSURL fileURLWithPath:path];
        ifSure=NO;
    }
    _mp=[[MPMoviePlayerViewController alloc]initWithContentURL:url];
    _mp.moviePlayer.shouldAutoplay=YES;
    _mp.moviePlayer.scalingMode=MPMovieScalingModeAspectFit;
    if (ifSure) {
        _mp.moviePlayer.movieSourceType=MPMovieSourceTypeStreaming;
    }else{
        _mp.moviePlayer.movieSourceType=MPMovieSourceTypeFile;
    
    }
    [self presentViewController:_mp animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
