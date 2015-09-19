//
//  NewsViewController.m
//  CFHelper
//
//  Created by qianfeng on 15/9/15.
//  Copyright (c) 2015年 丁晓雷. All rights reserved.
//

#import "NewsViewController.h"
#import "NewTableViewController.h"
#import "DetailSubViewViewController.h"
#import "Define.h"
@interface NewsViewController () <UIScrollViewDelegate,pushToanotherViewController>{
    UIScrollView *_mainScrollView;
    UIScrollView *_titleScrollView;
    UIView *_backgroundView;
    UIView *_selectView;
}

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addTitleViewWithTitle:@"新闻资讯"];
    [self createView];
    [self createMainScrollView];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setScrollView:(UIScrollView *)scrollView width:(CGFloat)width {
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.contentSize = CGSizeMake(width,scrollView.bounds.size.height);
}






-(void)createView{
    NSArray *title=@[@"最新",@"资讯",@"活动",@"娱乐",@"攻略"];
    
    _titleScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, 30)];
    NSInteger width=0;
    for(int i =0;i<title.count;i++){
        CGSize titleSize = [title[i] sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(MAXFLOAT, 30)];
        UIButton *button=[MyControl creatButtonWithFrame:CGRectMake(width+50*i, 0, titleSize.width+40, 30) target:self sel:@selector(btnClick:) tag:1001+i image:nil title:title[i]];
        width=titleSize.width+width;
        button.titleLabel.font=[UIFont systemFontOfSize:14];
        button.tintColor=[UIColor grayColor];
        [_titleScrollView addSubview:button];
    }
    //***//
    [self setScrollView:_titleScrollView width:width+50*5];
    _backgroundView=[[UIView alloc] initWithFrame:CGRectMake(0, 29, width+50*5, 1)];
    _backgroundView.backgroundColor=[UIColor colorWithRed:253/255.0 green:221/255.0 blue:217/255.0 alpha:1];
    [_titleScrollView addSubview:_backgroundView];
    
    CGSize titleSize = [title[0] sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(MAXFLOAT, 30)];
    _selectView = [[UIView alloc] initWithFrame:CGRectMake(0, 28, titleSize.width+50, 2)];
    _selectView.backgroundColor = [UIColor colorWithRed:248/255.0 green:139/255.0 blue:125/255.0 alpha:1];
    [_titleScrollView addSubview:_selectView];
    [self.view addSubview:_titleScrollView];
}

-(void)btnClick:(UIButton *)button{
    CGRect frame=button.frame;
    frame.size.height=2;
    frame.origin.y=28;
    [UIView animateWithDuration:0.4 animations:^{
        _selectView.frame=frame;
        _mainScrollView.contentOffset=CGPointMake((button.tag-1001)*ScreenSize.width, 0);
        if (5<=button.tag-1001&&button.tag-1001<=7) {
            _titleScrollView.contentOffset=CGPointMake(400-ScreenSize.width, 0);
        }else{
            _titleScrollView.contentOffset=CGPointMake(0, 0);
        }
    }];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int i =scrollView.contentOffset.x/ScreenSize.width;
    UIButton *button=(UIButton *)[_titleScrollView viewWithTag:1001+i];
    CGRect frame=button.frame;
    frame.size.height=2;
    frame.origin.y=28;
    [UIView animateWithDuration:0.4 animations:^{
        _selectView.frame=frame;
        if(5<=i&&i<=7){
            _titleScrollView.contentOffset=CGPointMake(400-ScreenSize.width, 0);
            
        }else{
            _titleScrollView.contentOffset=CGPointMake(0, 0);
            
        }
        
        
    }];
}
-(void)createMainScrollView{
    NSArray *urlArr=@[New_URL,ZiXun_URL,Action_URL,Fun_URL,War_URL];
    _mainScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, ScreenSize.width, ScreenSize.height-64-_titleScrollView.bounds.size.height)];
    _mainScrollView.delegate=self;
    for(int i =0;i<urlArr.count;i++){
        NewTableViewController *nav=[[NewTableViewController alloc] init];
        nav.requestUrl=urlArr[i];
        nav.tableView.frame= CGRectMake(                                                                                                                                                        i*ScreenSize.width, _mainScrollView.bounds.origin.y, _mainScrollView.bounds.size.width, _mainScrollView.bounds.size.height);
        [_mainScrollView addSubview:nav.tableView];
        nav.delegate = self;
    }
    [self setScrollView:_mainScrollView width:5*_mainScrollView.bounds.size.width];
    [self.view addSubview:_mainScrollView];
}
- (void)pushToanotherViewControllerWith:(NSString *)titleurl message:(NSString *)message {
    DetailSubViewViewController *dsvc = [[DetailSubViewViewController alloc] init];
    NSString *str = [NSString stringWithFormat:Videl_detail,titleurl];
    dsvc.nameUrl = str;
    dsvc.videoUrl = message;
    dsvc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:dsvc animated:YES];
   
}

@end
