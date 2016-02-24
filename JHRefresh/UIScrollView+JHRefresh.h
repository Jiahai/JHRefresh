//
//  UIScrollView+JHRefresh.h
//  JHRefresh
//
//  Created by Jiahai on 14-9-15.
//  Copyright (c) 2014年 Jiahai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHRefreshConfig.h"

@interface UIScrollView (JHRefresh)

/**
 *  添加下拉刷新HeaderView
 *
 *  @param aniViewClass 需要执行的动画的Class
 *  @param beginRefresh 开始刷新时需要执行的操作，如网络请求等
 */
- (void)addRefreshHeaderViewWithAniViewClass:(Class)aniViewClass beginRefresh:(void (^)())beginRefresh;

/**
 *  移除下拉刷新HeaderView
 */
- (void)removeRefreshHeaderView;

/**
 *  添加上拉加载FooterView
 *
 *  @param aniViewClass 需要执行的动画的Class
 *  @param beginRefresh 开始刷新时需要执行的操作，如网络请求等
 */
- (void)addRefreshFooterViewWithAniViewClass:(Class)aniViewClass beginRefresh:(void (^)())beginRefresh;

/**
 *  移除上拉加载FooterView
 */
- (void)removeRefreshFooterView;


/**
 *  自动开启下拉刷新
 */
- (void)headerStartRefresh;

/**
 *  结束下拉刷新
 *
 *  @param result 刷新结果
 */
- (void)headerEndRefreshingWithResult:(JHRefreshResult)result;
/**
 *  结束上拉加载
 */
- (void)footerEndRefreshing;
@end
