//
//  JHRefreshViewDelegate.h
//  JHRefresh
//
//  Created by Jiahai on 14-9-15.
//  Copyright (c) 2014年 Jiahai. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JHRefreshViewDelegate <NSObject>

@required
/**
 *  下拉时的动画
 */
- (void)refreshViewAniToBePulling;
/**
 *  下拉状态变成普通状态时的动画
 */
- (void)refreshViewAniToBeNormal;
/**
 *  刷新开始
 */
- (void)refreshViewBeginRefreshing;
/**
 *  刷新结束
 *
 *  @param success 刷新是否成功
 */
- (void)refreshViewEndRefreshing:(BOOL)success;

@end
