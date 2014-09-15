//
//  JHRefreshBaseView.h
//  JHRefresh
//
//  Created by Jiahai on 14-9-12.
//  Copyright (c) 2014年 Jiahai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHRefreshAniBaseView.h"

typedef NS_ENUM(NSInteger, JHRefreshState) {
    JHRefreshStatePulling       = 1,
    JHRefreshStateNormal,
    JHRefreshStateRefreshing
};

typedef NS_ENUM(NSInteger, JHRefreshViewType) {
    JHRefreshViewTypeHeader     = 0,
    JHRefreshViewTypeFooter
};

@interface JHRefreshBaseView : UIView
@property (nonatomic, weak, readonly)       UIScrollView *scrollView;

@property (nonatomic, assign)       JHRefreshState  state;

@property (nonatomic, copy)     void (^beginRefreshingBlock)();

@property (nonatomic, strong)   JHRefreshAniBaseView<JHRefreshViewDelegate>     *aniView;
//@property (nonatomic, copy)     void (^)

@property (nonatomic, readonly)     BOOL    refreshing;

+ (instancetype)createView;
@end
