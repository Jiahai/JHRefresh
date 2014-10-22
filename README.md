JHRefresh-可快速自定义下拉刷新界面
==========

##1、如何使用封装好的刷新组件？
    将JHRefresh文件夹加到项目中，#import "JHRefresh.h"，然后加入以下代码：
    
    __weak JHRefreshCommonExampleController *weakSelf = self;
    //加入下拉刷新组件
    [self.tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        //开始刷新时需要做的事情写在这里。
        
        //事情做完了别忘了结束刷新动画~~~
        [weakSelf.tableView headerEndRefreshingWithResult:JHRefreshResultSuccess];
        
    }];
    
    //加入上拉加载组件
    [self.tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        //开始刷新时需要做的事情写在这里。
        
        //事情做完了别忘了结束刷新动画~~~
        [weakSelf.tableView footerEndRefreshing];
        
    }];
    
Demo中封装了2种刷新效果（JHRefreshCommonAniView、JHRefreshAmazingAniView），可任意组合，Demo中的效果如下：

JHRefreshCommonAniView  | JHRefreshAmazingAniView  | JHRefreshCommonAniView <br> + <br> JHRefreshAmazingAniView
:-------------: | :-------------: | :-------------:
![](https://github.com/Jiahai/JHRefresh/blob/master/JHRefreshSnapShot/Common.gif)  | ![](https://github.com/Jiahai/JHRefresh/blob/master/JHRefreshSnapShot/Amazing.gif) | ![](https://github.com/Jiahai/JHRefresh/blob/master/JHRefreshSnapShot/Combine.gif)


 ##2、如何自定义刷新组件？
  * （1）自定义CustomViewAniView继承JHRefreshAniBaseView
  * （2）在CustomViewAniView.m中实现JHRefreshViewDelegate中的方法，对应的方法中实现UI的变换
```Objective-C
@required
/**
 *  下拉时的动画
 */
- (void)refreshViewAniToBePulling;
/**
 *  变成普通状态时的动画
 */
- (void)refreshViewAniToBeNormal;
/**
 *  刷新开始
 */
- (void)refreshViewBeginRefreshing;
/**
 *  刷新结束
 *
 *  @param result 刷新结果
 */
- (void)refreshViewEndRefreshing:(JHRefreshResult)result;

@optional
/**
 *  拖拽到对应的位置
 *
 *  @param pos 位置，范围：1-JHRefreshViewHeight
 */
- (void)refreshViewPullingToPosition:(NSInteger)pos;
```
* （3）使用自定义的CustomViewAniView
  ```Objective-C
  [self.tableView addRefreshHeaderViewWithAniViewClass:[CustomViewAniView class] beginRefresh:^{
        //开始刷新时需要做的事情写在这里。
        
        //事情做完了别忘了结束刷新动画~~~
        [weakSelf.tableView headerEndRefreshingWithResult:JHRefreshResultSuccess];
        
    }];
  ```
  
#具体详情请参看Demo
