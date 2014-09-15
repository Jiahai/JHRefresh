//
//  UIScrollView+JHExtension.m
//  JHRefresh
//
//  Created by Jiahai on 14-9-15.
//  Copyright (c) 2014年 Jiahai. All rights reserved.
//

#import "UIScrollView+JHExtension.h"

@implementation UIScrollView (JHExtension)
- (CGFloat)jh_contentInsetTop
{
    return self.contentInset.top;
}
- (void)setJh_contentInsetTop:(CGFloat)jh_contentInsetTop
{
    UIEdgeInsets inset = self.contentInset;
    inset.top = jh_contentInsetTop;
    self.contentInset = inset;
}
- (CGFloat)jh_contentInsetBottom
{
    return self.contentInset.bottom;
}
- (void)setJh_contentInsetBottom:(CGFloat)jh_contentInsetBottom
{
    UIEdgeInsets inset = self.contentInset;
    inset.bottom = jh_contentInsetBottom;
    self.contentInset = inset;
}
- (CGFloat)jh_contentInsetLeft
{
    return self.contentInset.left;
}
- (void)setJh_contentInsetLeft:(CGFloat)jh_contentInsetLeft
{
    UIEdgeInsets inset = self.contentInset;
    inset.left = jh_contentInsetLeft;
    self.contentInset = inset;
}
- (CGFloat)jh_contentInsetRight
{
    return self.contentInset.right;
}
- (void)setJh_contentInsetRight:(CGFloat)jh_contentInsetRight
{
    UIEdgeInsets inset = self.contentInset;
    inset.right = jh_contentInsetRight;
    self.contentInset = inset;
}
@end
