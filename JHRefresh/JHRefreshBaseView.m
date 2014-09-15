//
//  JHRefreshBaseView.m
//  JHRefresh
//
//  Created by Jiahai on 14-9-12.
//  Copyright (c) 2014年 Jiahai. All rights reserved.
//

#import "JHRefreshBaseView.h"
#import "JHRefreshConfig.h"

@implementation JHRefreshBaseView

+ (instancetype)createView
{
    return [[[self class] alloc] init];
}

- (id)initWithFrame:(CGRect)frame
{
    frame.size.height = JHRefreshViewHeight;
    frame.size.width = 320;
    frame.origin.y = -JHRefreshViewHeight;
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.backgroundColor = [UIColor clearColor];
        
        self.state = JHRefreshStateNormal;
        
    }
    return self;
}

- (void)setAniView:(JHRefreshAniBaseView<JHRefreshViewDelegate> *)aniView
{
    if(_aniView)
    {
        [_aniView removeFromSuperview];
    }
    aniView.backgroundColor = [UIColor redColor];
    JHLog(@"%@",NSStringFromCGRect(aniView.frame));
    [self addSubview:aniView];
    _aniView = aniView;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    
    [self.superview removeObserver:self forKeyPath:JHRefreshContentOffset];
    
    [newSuperview addObserver:self forKeyPath:JHRefreshContentOffset options:NSKeyValueObservingOptionNew context:nil];
    
    _scrollView = (UIScrollView *)newSuperview;
    
}

- (BOOL)refreshing
{
    return self.state == JHRefreshStateRefreshing;
}

- (void)setState:(JHRefreshState)state
{
    //状态不改变什么都不做
    if(_state == state)
        return;
    
    switch (_state) {
        case JHRefreshStateNormal:
        {
            if(state == JHRefreshStateRefreshing)
            {
                [_aniView refreshViewEndRefreshing];
            }
            else if(state == JHRefreshStatePulling)
            {
                [_aniView refreshViewAniToBePulling];
            }
        }
            break;
        case JHRefreshStateRefreshing:
        {
            [_aniView refreshViewBeginRefreshing];
        }
            break;
        case JHRefreshStatePulling:
        {
            if(state == JHRefreshStateNormal)
            {
                [_aniView refreshViewAniToBeNormal];
            }
            else if(state == JHRefreshStateRefreshing)
            {
                [_aniView refreshViewBeginRefreshing];
            }
        }
            break;
    }
    
    _state = state;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
