//
//  UpViewController.m
//  TitleViewController
//
//  Created by 宋学谦 on 16/8/22.
//  Copyright © 2016年 宋学谦. All rights reserved.
//

#import "UpViewController.h"
#import "MJRefresh.h"
#import "MJDIYHeader.h"


@interface UpViewController ()

@end

@implementation UpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"前页标题";
    self.dataArray = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", nil];
    self.view.backgroundColor = [UIColor greenColor];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - 64)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:self.tableView];
    
    [self headRS];
    [self footRS];
}

- (void)headRS{
    
    //1.正常刷新
//    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        NSLog(@"下拉刷新啦啦啦啦~~~!!!");
//        [self.tableView.mj_header endRefreshing];
//    }];
    
   
    
    
    
    // 2.正常 带动图刷新
    
    //设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i <= 7; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__0%lu@2x.png", (unsigned long)i]];
        [idleImages addObject:image];
    }
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *pullingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i <= 3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%lu@2x.png", (unsigned long)i]];
        [pullingImages addObject:image];
    }
    
    // 设置正在刷新状态的动画图片同上
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i <= 3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%lu@2x.png", (unsigned long)i]];
        [refreshingImages addObject:image];
    }

    
    
//    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
//    [header setImages:idleImages forState:MJRefreshStateIdle];
//    [header setImages:pullingImages forState:MJRefreshStatePulling];
//    [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
//    self.tableView.mj_header = header;
    
    // 马上进入刷新状态
//    [self.tableView.mj_header beginRefreshing];
    
    
    //3.下拉刷新 隐藏时间
//    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 设置自动切换透明度(在导航栏下面自动隐藏)
//    header.automaticallyChangeAlpha = YES;
    
    // 隐藏时间
//    header.lastUpdatedTimeLabel.hidden = YES;
    
    // 马上进入刷新状态
//    [header beginRefreshing];
    
    // 设置header
//    self.tableView.mj_header = header;
    
    
    
    //4.下拉刷新 隐藏状态和时间 有动图
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
//    MJRefreshGifHeader *header4 = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
//    
//    [header4 setImages:idleImages forState:MJRefreshStateIdle];
//    [header4 setImages:pullingImages forState:MJRefreshStatePulling];
//    [header4 setImages:refreshingImages forState:MJRefreshStateRefreshing];
    
    // 隐藏时间
//    header4.lastUpdatedTimeLabel.hidden = YES;
    
    // 隐藏状态
//    header4.stateLabel.hidden = YES;
    
    // 马上进入刷新状态
//    [header4 beginRefreshing];
    
    // 设置header
//    self.tableView.mj_header = header4;
    
    
    
    //5.下拉刷新 自定义文字
//    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 设置文字
//    [header setTitle:@"Pull down to refresh" forState:MJRefreshStateIdle];
//    [header setTitle:@"Release to refresh" forState:MJRefreshStatePulling];
//    [header setTitle:@"Loading ..." forState:MJRefreshStateRefreshing];
    
    // 设置字体
//    header.stateLabel.font = [UIFont systemFontOfSize:15];
//    header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];
    
    // 设置颜色
//    header.stateLabel.textColor = [UIColor redColor];
//    header.lastUpdatedTimeLabel.textColor = [UIColor blueColor];
    
    // 马上进入刷新状态
//    [header beginRefreshing];
    
    // 设置刷新控件
//    self.tableView.mj_header = header;
    
    
    //6.下拉刷新 自定义刷新控件
    self.tableView.mj_header = [MJDIYHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.tableView.mj_header beginRefreshing];



}

- (void)footRS{
    //1.正常加载
//    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        NSLog(@"上拉加载啦啦啦啦~~~!!!");
//        [self.tableView.mj_footer endRefreshing];
//
//    }];
    
    //2.上拉加载 动画图片
    
    // 设置正在刷新状态的动画图片同上
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i <= 3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%lu@2x.png", (unsigned long)i]];
        [refreshingImages addObject:image];
    }
//
//    MJRefreshBackGifFooter *footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
//    
//    [footer setImages:refreshingImages forState:MJRefreshStateRefreshing];
//    
//    self.tableView.mj_footer = footer;
//    [self.tableView.mj_footer beginRefreshing];
    
    
    
    //3.上拉加载 隐藏状态和时间 有动图
//    MJRefreshBackGifFooter *footer3 = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
//    
//    [footer3 setImages:refreshingImages forState:MJRefreshStateRefreshing];
//    
//     //隐藏状态
//    footer3.stateLabel.hidden = YES;
//    
//     //马上进入加载状态
//    [footer3 beginRefreshing];
//    
//     //设置header
//    self.tableView.mj_footer = footer3;
    
    
    //4.上拉加载 自定义文字

    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    // 设置文字
    [footer setTitle:@"Click or drag up to refresh" forState:MJRefreshStateIdle];
    [footer setTitle:@"Loading more ..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"No more data" forState:MJRefreshStateNoMoreData];
    
    // 设置字体
    footer.stateLabel.font = [UIFont systemFontOfSize:17];
    
    // 设置颜色
    footer.stateLabel.textColor = [UIColor blueColor];
    
    // 设置footer
    self.tableView.mj_footer = footer;
    
}


- (void)loadNewData{
    //正在刷新实现功能（如走解析接口）最后要结束刷新
    [self.tableView.mj_header endRefreshing];
}

- (void)loadMoreData{
    //正在刷新实现功能（如走解析接口）最后要结束刷新
    [self.tableView.mj_footer endRefreshing];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [self.dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    static NSString *str = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
    }
    
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor yellowColor];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.selected = NO;

    return cell;
    
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
