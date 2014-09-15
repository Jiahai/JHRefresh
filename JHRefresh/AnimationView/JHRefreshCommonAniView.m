//
//  JHRefreshCommonAniView.m
//  JHRefresh
//
//  Created by Jiahai on 14-9-15.
//  Copyright (c) 2014年 Jiahai. All rights reserved.
//

#import "JHRefreshCommonAniView.h"
#import "UIView+JHExtension.h"
#import "JHREfreshConfig.h"

#define JHRefreshLabelTextColor     JHRGBA(150,150,150,1)

@implementation JHRefreshCommonAniView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _statusLabel = [[UILabel alloc] init];
        _statusLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _statusLabel.font = [UIFont boldSystemFontOfSize:13];
        _statusLabel.textColor = JHRefreshLabelTextColor;
        _statusLabel.backgroundColor = [UIColor clearColor];
        _statusLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_statusLabel];
        _statusLabel.text = @"下拉可以刷新";
        
        _lastUpdateTimeLabel = [[UILabel alloc] init];
        _lastUpdateTimeLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _lastUpdateTimeLabel.font = [UIFont boldSystemFontOfSize:13];
        _lastUpdateTimeLabel.textColor = JHRefreshLabelTextColor;
        _lastUpdateTimeLabel.backgroundColor = [UIColor clearColor];
        _lastUpdateTimeLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_lastUpdateTimeLabel];
        _lastUpdateTimeLabel.text = @"上次刷新：2014-10-11 08:00";
        
        _arrowImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
        _arrowImgView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
        [self addSubview:_arrowImgView];
        
        _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activityView.bounds = _arrowImgView.bounds;
        _activityView.autoresizingMask = _arrowImgView.autoresizingMask;
        [self addSubview:_activityView];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 状态
    _statusLabel.frame = CGRectMake(0, 0, self.jh_width, self.jh_height*0.5);
    
    // 时间
    _lastUpdateTimeLabel.frame = CGRectMake(0, _statusLabel.jh_height, _statusLabel.jh_width, _statusLabel.jh_height);

    _arrowImgView.center = CGPointMake(self.bounds.size.width*0.5 - 100, self.bounds.size.height*0.5);
    _activityView.center = _arrowImgView.center;
}

#pragma mark - JHRefreshViewDelegate
- (void)refreshViewAniToBePulling
{
    _statusLabel.text = @"放开即可刷新~_-";
    [UIView animateWithDuration:JHRefreshFastAnimationDuration animations:^{
        _arrowImgView.transform = CGAffineTransformMakeRotation(M_PI);
    }];
}
- (void)refreshViewAniToBeNormal
{
    _statusLabel.text = @"下拉可以刷新";
    [UIView animateWithDuration:JHRefreshFastAnimationDuration animations:^{
        _arrowImgView.transform = CGAffineTransformIdentity;
    }];
}
- (void)refreshViewBeginRefreshing
{
    _statusLabel.text = @"正在加载。。。";
    
}

- (void)refreshViewEndRefreshing
{
    _statusLabel.text = @"加载结束!";
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
