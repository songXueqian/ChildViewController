//
//  RightViewController.m
//  TitleViewController
//
//  Created by 宋学谦 on 16/8/26.
//  Copyright © 2016年 宋学谦. All rights reserved.
//

#import "RightViewController.h"

@interface RightViewController ()

@end

@implementation RightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.dataArray = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", nil];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - 64)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:self.tableView];


}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.f;
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
    cell.backgroundColor = [UIColor cyanColor];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.selected = NO;
    
    return cell;
    
}


- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //删除按钮
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath){
        
        [_dataArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }];
    
    
    //置顶按钮
    UITableViewRowAction *toTopRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"置顶" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath){
        
        NSLog(@"置顶");
        
    
        
        [_dataArray exchangeObjectAtIndex:indexPath.row withObjectAtIndex:0];
        
        NSIndexPath *sourceIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
        NSIndexPath *destinationIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        
        [tableView moveRowAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
        
        tableView.editing = NO;
        

    }];
    toTopRowAction.backgroundColor = [UIColor orangeColor];
    
    //其他按钮
    UITableViewRowAction *otherRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"其他" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath){
        NSLog(@"其他");
        [self.tableView reloadData];
        
    }];
    
    otherRowAction.backgroundColor = [UIColor lightGrayColor];
    
    //返回按钮数组
    return @[deleteRowAction, toTopRowAction, otherRowAction];
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
