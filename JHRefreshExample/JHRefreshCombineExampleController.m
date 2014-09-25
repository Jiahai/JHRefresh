//
//  JHRefreshCombineExampleController.m
//  JHRefresh
//
//  Created by Jiahai on 14-9-24.
//  Copyright (c) 2014年 Jiahai. All rights reserved.
//

#import "JHRefreshCombineExampleController.h"
#import "JHRefreshCommonAniView.h"
#import "JHRefreshAmazingAniView.h"

@interface JHRefreshCombineExampleController ()
@end

@implementation JHRefreshCombineExampleController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"组合刷新"];
    
    __weak JHRefreshCombineExampleController *weakSelf = self;
    [self.tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        
        //延时隐藏refreshView;
        double delayInSeconds = 2.0;
        //创建延期的时间 2S
        dispatch_time_t delayInNanoSeconds =dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        //延期执行
        dispatch_after(delayInNanoSeconds, dispatch_get_main_queue(), ^{
            weakSelf.count =20;
            
            [weakSelf.tableView reloadData];
            
            [weakSelf.tableView headerEndRefreshingWithResult:JHRefreshResultNone];
        });
        
    }];
    
    [self.tableView addRefreshFooterViewWithAniViewClass:[JHRefreshAmazingAniView class] beginRefresh:^{
        
        //延时隐藏refreshView;
        double delayInSeconds = 2.0;
        //创建延期的时间 2S
        dispatch_time_t delayInNanoSeconds =dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        //延期执行
        dispatch_after(delayInNanoSeconds, dispatch_get_main_queue(), ^{
            weakSelf.count +=20;
            
            [weakSelf.tableView reloadData];
            
            [weakSelf.tableView footerEndRefreshing];
        });
        
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
