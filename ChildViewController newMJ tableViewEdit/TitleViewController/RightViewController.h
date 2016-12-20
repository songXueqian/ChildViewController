//
//  RightViewController.h
//  TitleViewController
//
//  Created by 宋学谦 on 16/8/26.
//  Copyright © 2016年 宋学谦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RightViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataArray;

@end
