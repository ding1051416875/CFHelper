//
//  BaseViewController.m
//  CFHelper
//
//  Created by qianfeng on 15/9/15.
//  Copyright (c) 2015年 丁晓雷. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed: @"bg_navbar_black"] forBarMetrics:UIBarMetricsDefault];
    UIImage *image=[UIImage imageNamed:@"back"];
    image=[image resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 0, -30)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:image forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(500, 500) forBarMetrics:UIBarMetricsDefault];
    
    // Do any additional setup after loading the view.
}

-(void)addTitleViewWithTitle:(NSString *)title{
    UILabel *titleLabel=[MyControl creatLabelWithFrame:CGRectMake(0, 0, 40, 30) text:title];
    titleLabel.textAlignment=NSTextAlignmentLeft;
    titleLabel.font=[UIFont fontWithName:@"Arial Rounded MT Bold" size:18.f];
    titleLabel.textColor=[UIColor colorWithRed:1 green:0.97 blue:0 alpha:1];
    self.navigationItem.titleView=titleLabel;
}
-(void)addItemWithCustomView:(NSArray *)customViews isLeft:(BOOL)isLeft{
    NSMutableArray *items=[[NSMutableArray alloc] init];
    for(int i =0; i<customViews.count;i++){
        UIBarButtonItem *item=[[UIBarButtonItem alloc] initWithCustomView:customViews[i]];
        [items addObject:item];
    }
    if (isLeft) {
        self.navigationItem.leftBarButtonItems=items;
    }else{
        self.navigationItem.rightBarButtonItems=items;
    }
}

#pragma mark - tableView协议
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"子类重写");
    return 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"子类重写");
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"子类重写");
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"子类重写");
    return nil;
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
