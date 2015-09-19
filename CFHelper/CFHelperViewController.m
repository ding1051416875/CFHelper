//
//  CFHelperViewController.m
//  CFHelper
//
//  Created by qianfeng on 15/9/15.
//  Copyright (c) 2015年 丁晓雷. All rights reserved.
//

#import "CFHelperViewController.h"
#import "BaseViewController.h"

@interface CFHelperViewController ()

@end

@implementation CFHelperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createView];
}
-(void)createView{
    NSArray *imageView = @[@"tab_infomation_normal",@"tab_video_normal",@"tab_heros_normal",@"tab_community_normal",@"tab_more_normal"];
    NSArray *imageViewArr = @[@"tab_more_selected",@"tab_community_selected",@"tab_infomation_selected",@"tab_community_selected",@"tab_more_selected"];
    NSArray *titles = @[@"资讯",@"视频",@"查询",@"真人秀",@"设置"];
    NSArray *controllers=@[@"NewsViewController",@"VideoViewController",@"SearchViewController",@"ReallyViewController",@"SettingViewController"];
    NSMutableArray *viewsControllers=[[NSMutableArray alloc] init];
    for(int i=0;i<controllers.count;i++){
        Class cls=NSClassFromString(controllers[i]);
        BaseViewController *vc=[[cls alloc] init];
        UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:vc];
        nav.tabBarItem.title=titles[i];
        nav.tabBarItem.image=[[UIImage imageNamed:imageView[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nav.tabBarItem.selectedImage = [[UIImage imageNamed:imageViewArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [viewsControllers addObject:nav];
    }
    self.viewControllers=viewsControllers;
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"底部_bto"]];
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
