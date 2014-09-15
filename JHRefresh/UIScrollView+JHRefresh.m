//
//  UIScrollView+JHRefresh.m
//  JHRefresh
//
//  Created by Jiahai on 14-9-15.
//  Copyright (c) 2014年 Jiahai. All rights reserved.
//

#import "UIScrollView+JHRefresh.h"
#import "JHRefreshHeaderView.h"
#import "AnimationView/JHRefreshCommonAniView.h"

@implementation UIScrollView (JHRefresh)

- (void)addRefreshHeaderView:(void (^)())beginRefresh
{
    JHRefreshHeaderView *headerView = [JHRefreshHeaderView createView];
    headerView.beginRefreshingBlock = beginRefresh;
    headerView.aniView = [[JHRefreshCommonAniView alloc] initWithFrame:headerView.bounds];
    [self addSubview:headerView];
}

@end
