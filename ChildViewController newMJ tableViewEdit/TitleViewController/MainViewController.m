//
//  MainViewController.m
//  TitleViewController
//
//  Created by 宋学谦 on 16/8/22.
//  Copyright © 2016年 宋学谦. All rights reserved.
//


/*
 
1.例如QQ音乐首页，childView应用
2.MJRefresh新版应用 加载刷新动画 UpViewController
3.tableView editCell 置顶/删除 RightViewController
 
*/






#import "MainViewController.h"
#import "RightViewController.h"

#define MainColor [UIColor colorWithRed:(0 / 255.0f) green:(73 / 255.0f) blue:(136 / 255.0f) alpha:1.0f]

@interface MainViewController ()
@property (nonatomic, strong)UpViewController *upVC;
@property (nonatomic, strong)NextViewController *nextVC;
@property (nonatomic, strong)MidViewController *midVC;

@property (nonatomic, strong)UIViewController *currentViewController;


@end

@implementation MainViewController

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"WillAppear");
}

- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"DidAppear");

}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"WillDisappear");
    
}


- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"DidDisappear");

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"DidLoad");
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBarTintColor:MainColor];

    self.view.backgroundColor = [UIColor redColor];

    _headScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(70, 0, [UIScreen mainScreen].bounds.size.width - 140, 44)];
    _headScrollView.backgroundColor = [UIColor clearColor];
    [_headScrollView setContentSize:CGSizeMake(0, 44)];
    _headScrollView.showsVerticalScrollIndicator = NO;
    self.navigationItem.titleView = _headScrollView;

    
    self.firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.firstButton setFrame:CGRectMake(0, 0, _headScrollView.frame.size.width / 3, 44)];
    self.firstButton.backgroundColor = [UIColor clearColor];
    [self.firstButton setTitle:@"头条" forState:UIControlStateNormal];
    [self.firstButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.firstButton addTarget:self action:@selector(buttonClick1:) forControlEvents:UIControlEventTouchUpInside];
    [_headScrollView addSubview:self.firstButton];
    
    self.secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.secondButton setFrame:CGRectMake(_headScrollView.frame.size.width / 3, 0, _headScrollView.frame.size.width / 3, 44)];
    self.secondButton.backgroundColor = [UIColor clearColor];
    [self.secondButton setTitle:@"今日" forState:UIControlStateNormal];
    [self.secondButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.secondButton addTarget:self action:@selector(buttonClick2:) forControlEvents:UIControlEventTouchUpInside];
    [_headScrollView addSubview:self.secondButton];
    
    self.thirdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.thirdButton setFrame:CGRectMake(2 * _headScrollView.frame.size.width / 3, 0, _headScrollView.frame.size.width / 3, 44)];
    self.thirdButton.backgroundColor = [UIColor clearColor];
    [self.thirdButton setTitle:@"焦点" forState:UIControlStateNormal];
    [self.thirdButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.thirdButton addTarget:self action:@selector(buttonClick3:) forControlEvents:UIControlEventTouchUpInside];
    [_headScrollView addSubview:self.thirdButton];
    
    
    self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.leftButton setFrame:CGRectMake(0, 0, 25, 25)];
    [self.leftButton setBackgroundImage:[UIImage imageNamed:@"geren.png"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftButton];
    
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightButton setFrame:CGRectMake(0, 0, 25, 25)];
    [self.rightButton setBackgroundImage:[UIImage imageNamed:@"common_message.png"] forState:UIControlStateNormal];
    [self.rightButton addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightButton];


    self.backScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64)];
    self.backScrollView.backgroundColor = [UIColor clearColor];
    [self.backScrollView setContentSize:CGSizeMake(3 * [UIScreen mainScreen].bounds.size.width, 0)];
    self.backScrollView.bounces = NO;
    self.backScrollView.pagingEnabled = YES;
    self.backScrollView.delegate = self;
    self.backScrollView.showsHorizontalScrollIndicator = NO;
//    self.backScrollView.userInteractionEnabled = NO;
    [self.view addSubview:self.backScrollView];

    
    self.upVC = [[UpViewController alloc] init];
    [self addChildViewController:self.upVC];
    
    self.midVC = [[MidViewController alloc] init];
    [self addChildViewController:self.midVC];
    
    self.nextVC = [[NextViewController alloc] init];
    [self addChildViewController:self.nextVC];
    
    [self.backScrollView addSubview:self.upVC.view];
    [self.upVC.view setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64)];
    
    [self.backScrollView addSubview:self.midVC.view];
    [self.midVC.view setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64)];
    
    [self.backScrollView addSubview:self.nextVC.view];
    [self.nextVC.view setFrame:CGRectMake(2 * [UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64)];


    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSLog(@"scrollView ====== %f", scrollView.contentOffset.x);
    
    if (self.backScrollView.contentOffset.x < [[UIScreen mainScreen] bounds].size.width) {
        
        [self.firstButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [self.secondButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self.thirdButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
//        self.currentViewController = self.upVC;
//        [self.upVC didMoveToParentViewController:self.currentViewController];
        
    } else if (self.backScrollView.contentOffset.x >= [[UIScreen mainScreen] bounds].size.width && self.backScrollView.contentOffset.x < 2 * [[UIScreen mainScreen] bounds].size.width) {
        
        [self.firstButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self.secondButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [self.thirdButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
//        self.currentViewController = self.midVC;
//        [self.midVC didMoveToParentViewController:self.currentViewController];
        
    } else {
        
        [self.firstButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self.secondButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self.thirdButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        
//        self.currentViewController = self.nextVC;
//        [self.nextVC didMoveToParentViewController:self.currentViewController];
    }
}



- (void)buttonClick1:(UIButton *)tap{
    

    
    
//    if (self.currentViewController == self.upVC) {
//        
//        self.currentViewController = self.upVC;
//        
//    }else{
    
        
//        [self transitionFromViewController:self.currentViewController toViewController:self.upVC duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        
        
        [UIView animateWithDuration:0.3 animations:^{
            self.backScrollView.contentOffset = CGPointMake(0, 0);
            
            [self.firstButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            [self.secondButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [self.thirdButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            
//            self.currentViewController = self.upVC;
//            [self.upVC didMoveToParentViewController:self.currentViewController];
        }];
        
            
//        }];

        
//    }

    
    

    
}

- (void)buttonClick2:(UIButton *)tap{
    


//    if (self.currentViewController == self.midVC) {
//        self.currentViewController = self.midVC;
//
//    } else {
//        [self transitionFromViewController:self.currentViewController toViewController:self.midVC duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{

            self.backScrollView.contentOffset = CGPointMake([[UIScreen mainScreen] bounds].size.width, 0);

            [self.firstButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [self.secondButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            [self.thirdButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            
//            self.currentViewController = self.midVC;
//            [self.midVC didMoveToParentViewController:self.currentViewController];
        }];
         
//        }];

//    }
    
    
    

    
}

- (void)buttonClick3:(UIButton *)tap{
    
    
//    if (self.currentViewController == self.nextVC) {
//        self.currentViewController = self.nextVC;
//        
//    } else {
//        [self transitionFromViewController:self.currentViewController toViewController:self.nextVC duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{

            self.backScrollView.contentOffset = CGPointMake(2 * [[UIScreen mainScreen] bounds].size.width, 0);

            [self.firstButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [self.secondButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [self.thirdButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            
//            self.currentViewController = self.nextVC;
//            [self.nextVC didMoveToParentViewController:self.currentViewController];
            
        }];
            
//        }];
        
//    }
}


- (void)rightAction{
    RightViewController *rightVC = [[RightViewController alloc] init];
    [self.navigationController pushViewController:rightVC animated:YES];
    
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
