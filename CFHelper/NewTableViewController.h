//
//  NewTableViewController.h
//  CFHelper
//
//  Created by qianfeng on 15/9/16.
//  Copyright (c) 2015年 丁晓雷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"

@protocol pushToanotherViewController <NSObject>

- (void)pushToanotherViewControllerWith:(NSString *) titleurl message:(NSString *) message;
@end
@interface NewTableViewController : UITableViewController{
    NSMutableArray *_dataArr;
    AFHTTPRequestOperationManager *_manager;
    NSInteger _currentPage;
    BOOL _isPullRefreshing;
    BOOL _isLoadMore;
}
@property (nonatomic, assign) id<pushToanotherViewController>delegate;
@property(nonatomic,retain)UITableView *_tableView;
@property(nonatomic,copy)NSString *requestUrl;
@end
