//
//  NewTableViewController.m
//  CFHelper
//
//  Created by qianfeng on 15/9/16.
//  Copyright (c) 2015年 丁晓雷. All rights reserved.
//

#import "NewTableViewController.h"
#import "NewMessageCell.h"
#import "New2MessageCell.h"
#import "NewsModel.h"

@interface NewTableViewController ()<UIScrollViewDelegate>{
    UIScrollView *_scrollView;
}

@end

@implementation NewTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self show];
    [self creatTableView];
    
    [self creatRefsh];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)creatTableView{
    _dataArr=[[NSMutableArray alloc] init];
}
-(void)getdownload:(NSString *)urlStr with:(NSInteger)page {
    NSString *urlString=[NSString stringWithFormat:self.requestUrl,_currentPage];
    if (urlString== nil) {
        urlString=@"";
    }
    _manager=[AFHTTPRequestOperationManager manager];
    [_manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self downloadDataSuccessFromRequest:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
-(void)downloadDataSuccessFromRequest:(id)responseObject{
    NSArray *arr=responseObject[@"data"];
    for(NSDictionary *cosplayDict in arr){
        NewsModel *model=[[NewsModel alloc] init];
        [model setValuesForKeysWithDictionary:cosplayDict];
        model.id=cosplayDict[@"id"];
        [_dataArr addObject:model];
    }
    [self.tableView reloadData];
    [self endRefreshing];
}
- (void)creatRefsh {
    [self.tableView addHeaderWithCallback:^{
        if (_isPullRefreshing) {
            return ;
        }
        _isPullRefreshing = YES;
        _currentPage = 1;
        [self getdownload:self.requestUrl with:_currentPage];
    }];
    
    //上拉加载
    [self.tableView addFooterWithCallback:^{
        if (_isLoadMore) {
            return ;
        }
        _isLoadMore = YES;
        _currentPage ++;
        [self getdownload:self.requestUrl with:_currentPage];
    }];
}
//停止刷新
- (void)endRefreshing {
    _isLoadMore = NO;
    _isPullRefreshing = NO;
    [self.tableView headerEndRefreshing];
    [self.tableView footerEndRefreshing];
}

- (void)show{
    [self getdownload:self.requestUrl with:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 90;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsModel *model = _dataArr[indexPath.row];
    static NSString *cellID = @"NewMessageCell";
    if (model.video_url.length != 0 && model.pic_url != 0) {
        NewMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"NewMessageCell" owner:self options:nil] lastObject];
        }
        [self showDataWithCell:cell cosplayModel:model indexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        static NSString *cellId = @"New2Message";
       New2MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"New2MessageCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [self showDataCell:cell cosplayModel:model indexPath:indexPath];
        return cell;
    }

}
- (void)showDataWithCell:(NewMessageCell *)cell  cosplayModel:(NewsModel *)model indexPath:(NSIndexPath*)indexPath  {
    cell.pic_urlImageView.layer.masksToBounds = YES;
    cell.pic_urlImageView.layer.cornerRadius = 3;
    [cell.pic_urlImageView sd_setImageWithURL:[NSURL URLWithString:model.pic_url] placeholderImage:[UIImage imageNamed:@"addefault_people.png"]];
    cell.playImageView.image = [UIImage imageNamed: @"play"];
    cell.titleLabel.text = model.title;
    cell.descLabel.numberOfLines = 0;
    cell.descLabel.text = model.desc;
    NSString *str = [LZXHelper dateStringFromNumberTimer:model.published];
    NSArray *arr = [str componentsSeparatedByString:@" "];
    NSArray *arrDate = [arr[0] componentsSeparatedByString:@"-"];
    NSString *strDate = [arrDate[1] stringByAppendingFormat:@"-%@",arrDate[2]];
    NSArray *arrD = [arr[1] componentsSeparatedByString:@":"];
    NSString *strD = [arrD[0] stringByAppendingFormat:@":%@",arrD[1]];
    NSString *string = [strDate stringByAppendingFormat:@" %@",strD];
    cell.publishedLabel.text = string;
}
- (void)showDataCell:(New2MessageCell *)cell  cosplayModel:(NewsModel *)model indexPath:(NSIndexPath*)indexPath  {
    cell.titleLabel.text = model.title;
    cell.descLabel.numberOfLines = 0;
    cell.descLabel.text = model.desc;
    NSString *str = [LZXHelper dateStringFromNumberTimer:model.published];
    NSArray *arr = [str componentsSeparatedByString:@" "];
    NSArray *arrDate = [arr[0] componentsSeparatedByString:@"-"];
    NSString *strDate = [arrDate[1] stringByAppendingFormat:@"-%@",arrDate[2]];
    NSArray *arrD = [arr[1] componentsSeparatedByString:@":"];
    NSString *strD = [arrD[0] stringByAppendingFormat:@":%@",arrD[1]];
    NSString *string = [strDate stringByAppendingFormat:@" %@",strD];
    cell.timeLabel.text = string;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsModel *model = _dataArr[indexPath.row];
    [self.delegate pushToanotherViewControllerWith:model.id message:model.video_url];
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
