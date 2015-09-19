//
//  BaseViewController.h
//  CFHelper
//
//  Created by qianfeng on 15/9/15.
//  Copyright (c) 2015年 丁晓雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
//<UITableViewDataSource,UITableViewDelegate>{
//    UITableView *_tableView;
//    NSMutableArray *_dataArr;
//    AFHTTPRequestOperationManager *_manager;
//    NSInteger _currentPage;
//    BOOL _isPullRefreshing;
//    BOOL _isLoadMore;
//    
//}
-(void)addTitleViewWithTitle:(NSString *)title;

-(void)addItemWithCustomView:(NSArray *)customViews isLeft:(BOOL)isLeft;
@end
