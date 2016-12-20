//
//  MainViewController.h
//  TitleViewController
//
//  Created by 宋学谦 on 16/8/22.
//  Copyright © 2016年 宋学谦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UpViewController.h"
#import "NextViewController.h"
#import "MidViewController.h"

@interface MainViewController : UIViewController<UIScrollViewDelegate>
@property (nonatomic, strong)UIScrollView *headScrollView;

@property (nonatomic, strong)UIButton *rightButton;
@property (nonatomic, strong)UIButton *leftButton;


@property (nonatomic, strong)UIButton *firstButton;
@property (nonatomic, strong)UIButton *secondButton;
@property (nonatomic, strong)UIButton *thirdButton;

@property (nonatomic, strong)UIScrollView *backScrollView;

@end
