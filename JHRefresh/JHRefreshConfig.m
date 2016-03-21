//
//  JHRefreshConfig.m
//  JHRefresh
//
//  Created by Jiahai on 14-9-12.
//  Copyright (c) 2014年 Jiahai. All rights reserved.
//

#import "JHRefreshConfig.h"

const CGFloat JHRefreshViewHeight = 60.0;
const CGFloat JHRefreshFastAnimationDuration = 0.2;
const CGFloat JHRefreshSlowAnimationDuration = 0.4;
const CGFloat JHRefreshShowResultAnimationDuration = 0.8;


NSString *const JHRefreshContentOffset = @"contentOffset";
NSString *const JHRefreshContentSize = @"contentSize";

NSString *const JHRefreshConfigKey = @"JHRefreshConfig";
NSString *const JHRefreshLastUpdateTimeKey = @"JHRefreshLastUpdateTime";
NSString *const JHRefreshLastUpdateTimeFormat = @"yyyy-MM-dd HH:mm";

/**
 *  JHRefreshConfig的目录结构
    --NSUserDefaults
      |
       ——JHRefreshConfigKey             //JHRefresh所有的配置存储路径
         |
         |——JHRefreshLastUpdateTimeKey  //lastUpdateTime配置存储路径
 */

@implementation JHRefreshConfig

+ (NSString *)getLastUpdateTimeWithRefreshViewID:(NSInteger)ID
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSDictionary *refreshDic = [userDefault objectForKey:JHRefreshConfigKey];
    NSDate *time = [[refreshDic objectForKey:JHRefreshLastUpdateTimeKey] objectForKey:[NSString stringWithFormat:@"%@_%d",JHRefreshLastUpdateTimeKey,(int)ID]];
    
    return [self formatTimeString:time];
}

+ (NSString *)formatTimeString:(NSDate *)time
{
    if(!time || ![time isKindOfClass:[NSDate class]])
    {
        return @"";//[NSString stringWithFormat:@"%@更新", [[self class] nowTimeString]];
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:JHRefreshLastUpdateTimeFormat];
    
    NSDate *nowDate = [NSDate date];
    
    int interval = nowDate.timeIntervalSince1970 - time.timeIntervalSince1970;
    
    int dayInterval = 24*60*60;
    int hourInterval = 60*60;
    int miniteInterval = 60;
    
    switch (interval/dayInterval) {
        case 0:
        {
            switch (interval/hourInterval) {
                case 0:
                {
                    switch (interval/miniteInterval) {
                        case 0:
                        {
                            return [NSString stringWithFormat:@"%d秒前更新",MAX(interval,1)];
                        }
                            break;
                            
                        default:
                            return [NSString stringWithFormat:@"%d分钟前更新",MAX(interval/miniteInterval,1)];
                            break;
                    }
                }
                    break;
                default:
                    return [NSString stringWithFormat:@"%d小时前更新",MAX(interval/hourInterval,1)];
                    break;
            }
        }
            break;
        case 1:
        {
            return @"1天前更新";
        }
            break;
        default:
            return [NSString stringWithFormat:@"%@更新",[dateFormatter stringFromDate:time]];
            break;
    }
    
    return nil;
}

+ (void)updateLastUpdateTimeWithRefreshViewID:(NSInteger)ID
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *refreshDic = [NSMutableDictionary dictionaryWithDictionary:[userDefault objectForKey:JHRefreshConfigKey]];
    if(!refreshDic)
    {
        refreshDic = [NSMutableDictionary dictionary];
    }
    NSMutableDictionary *lastUpdateTimeDic = [NSMutableDictionary dictionaryWithDictionary:[refreshDic objectForKey:JHRefreshLastUpdateTimeKey]];
    if(!lastUpdateTimeDic)
    {
        lastUpdateTimeDic = [NSMutableDictionary dictionary];
    }
    [lastUpdateTimeDic setObject:[NSDate date] forKey:[NSString stringWithFormat:@"%@_%d",JHRefreshLastUpdateTimeKey,(int)ID]];
    [refreshDic setObject:lastUpdateTimeDic forKey:JHRefreshLastUpdateTimeKey];
    
    [userDefault setObject:refreshDic forKey:JHRefreshConfigKey];
    [userDefault synchronize];
}

@end