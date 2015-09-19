//
//  VideoViewController.m
//  CFHelper
//
//  Created by qianfeng on 15/9/15.
//  Copyright (c) 2015年 丁晓雷. All rights reserved.
//

#import "VideoViewController.h"
#import "JHRefresh.h"
#import "VideoDetailWebView.h"
#import "DetailSubViewViewController.h"
#import "Define.h"

@interface VideoViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
   
        AFHTTPRequestOperationManager *_manager;
    
    }


@property(nonatomic)BOOL isRefreshing;
@property(nonatomic)BOOL isLoadMore;
@property(nonatomic)NSInteger currentPage;
@property (nonatomic,strong) NSMutableArray *dataArr;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.isRefreshing=NO;
    self.isLoadMore=NO;
    self.currentPage=1;
    [self createTableView];
    [self createRequest];
    [self loadDataWithPage:self.currentPage ];
    [self createRefreshView];

}
#pragma  mark - 刷新呢
-(void)createRefreshView{
    __weak typeof (self) weakSelf=self;
    [self.tableView addHeaderWithCallback:^{
        if (weakSelf.isRefreshing) {
            //正在刷新
            return ;
        }
        weakSelf.isRefreshing=YES;
        weakSelf.currentPage=1;
        [weakSelf loadDataWithPage:weakSelf.currentPage];
    }];
    [self.tableView addFooterWithCallback:^{
        if (weakSelf.isLoadMore) {
            return ;
        }
        weakSelf.isLoadMore=YES;
        weakSelf.currentPage++;
        [weakSelf loadDataWithPage:weakSelf.currentPage];
    }];
}
-(void)createTableView{
    [self addTitleViewWithTitle:@"游戏视频"];
    _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0,0,kScreen.width, kScreen.height-44) style:UITableViewStylePlain];
   
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [_tableView registerNib:[UINib nibWithNibName:@"VideoCell" bundle:nil] forCellReuseIdentifier:@"VideoCell"];
    _tableView.backgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell1"]];;
    [self.view addSubview:_tableView];
    
    
}
-(void)createRequest{
    _manager=[AFHTTPRequestOperationManager manager];
    //设置 响应 格式 二进制 不解析
    _manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    self.dataArr=[[NSMutableArray alloc] init];
}
#pragma mark - 下载解析数据
-(void)loadDataWithPage:(NSInteger)page{
    NSString *url=[NSString stringWithFormat:Video_ZuiXin,page];
    __weak typeof (self) weakSelf=self;
    [_manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
       
        if (responseObject) {
            if (weakSelf.currentPage==1) {
                [weakSelf.dataArr removeAllObjects];
            }
            NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSArray *itemArr=dict[@"data"];
           
            for(NSDictionary *itemDict in itemArr){
                VideoModel *model=[[VideoModel alloc] init];
                [model setValuesForKeysWithDictionary:itemDict];
                [weakSelf.dataArr addObject:model];
               
            }
            
                [weakSelf.tableView reloadData];
                [weakSelf endRefreshing];
                
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [weakSelf endRefreshing];
       
        
    }];
}
- (void)endRefreshing {
//    if (self.isRefreshing) {
//        self.isRefreshing = NO;
//        [self.tableView headerEndRefreshingWithResult:JHRefreshResultSuccess];
//    }
//    if (self.isLoadMore) {
//        self.isLoadMore = NO;
//        [self.tableView footerEndRefreshing];
//    }
    _isLoadMore = NO;
    _isRefreshing = NO;
    [self.tableView headerEndRefreshing];
    [self.tableView footerEndRefreshing];
}


//#pragma mark -tableView协议
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoCell *cell=[tableView dequeueReusableCellWithIdentifier:@"VideoCell" forIndexPath:indexPath];
    NSLog(@"%@",self.dataArr[indexPath.row]);
    VideoModel *model=self.dataArr[indexPath.row];
    [cell showDataWithModel:model];
    return cell;
}

- (void)pushToanotherViewControllerWith:(NSString *)titleurl message:(NSString *)message {
    VideoDetailWebView *dsvc = [[VideoDetailWebView alloc] init];
    NSString *str=[NSString stringWithFormat:Videl_detail,titleurl];
    dsvc.nameUrl=str;
    dsvc.videoUrl = message;
    dsvc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:dsvc animated:YES];
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoDetailWebView *dsvc=[[VideoDetailWebView alloc] init];
    
    VideoModel *model=self.dataArr[indexPath.row];
    dsvc.nameUrl=[NSString stringWithFormat:Videl_detail,model.item_id];
    dsvc.videoUrl=model.video_url;
    
    [self.navigationController pushViewController:dsvc animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
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
