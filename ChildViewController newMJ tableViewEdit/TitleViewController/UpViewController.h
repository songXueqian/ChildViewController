//
//  UpViewController.h
//  TitleViewController
//
//  Created by 宋学谦 on 16/8/22.
//  Copyright © 2016年 宋学谦. All rights reserved.
//

#import "MainViewController.h"

@interface UpViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataArray;


@property (nonatomic, strong)NSMutableArray *idleImages;
@property (nonatomic, strong)NSMutableArray *pullingImages;
@property (nonatomic, strong)NSMutableArray *refreshingImages;


@end
