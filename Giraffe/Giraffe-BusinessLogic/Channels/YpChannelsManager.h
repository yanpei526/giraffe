//
//  YpChannelManager.h
//  Giraffe
//
//  Created by yanpei on 25/1/16.
//
//

#import <Foundation/Foundation.h>
#import "YpChannelsModel.h"
#import "YpNetBaseManager.h"

@interface YpChannelsManager : YpNetBaseManager

@property (nonatomic, strong) YpChannelsModel *channelList;

- (void)request:(managerCallback)callback;

@end
