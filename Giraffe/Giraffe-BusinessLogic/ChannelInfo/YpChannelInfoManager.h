//
//  ChannelInfoManager.h
//  Giraffe
//
//  Created by yanpei on 28/1/16.
//
//

#import <Foundation/Foundation.h>
#import "YpNetBaseManager.h"
#import "YpChannelInfoModel.h"

@interface YpChannelInfoManager : YpNetBaseManager
@property (nonatomic, strong) YpChannelInfoModel *channelInfo;
- (void)requestWithChannelID:(NSString*)channelID callback:(managerCallback)callback;
@end
