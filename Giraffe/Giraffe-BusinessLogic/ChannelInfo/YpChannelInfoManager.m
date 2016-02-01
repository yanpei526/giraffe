//
//  ChannelInfoManager.m
//  Giraffe
//
//  Created by yanpei on 28/1/16.
//
//

#import "YpChannelInfoManager.h"

@implementation YpChannelInfoManager

- (void)requestWithChannelID:(NSString*)channelID callback:(managerCallback)callback
{
    callback = [callback copy];
    
    NSString *urlString = @"http://po.funshion.com/v6/config/channelhome";
    NSDictionary *params = @{@"nav_id" : channelID};
    
    [self requestUrl:urlString
              params:params
          modelClass:[YpChannelInfoModel class]
            callback:^(YpBaseModel *model, NSError *error) {
        _channelInfo = (YpChannelInfoModel*)model;
        if (callback) {
            callback(model, error);
        }
    }];
}

@end
