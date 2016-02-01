//
//  YpHotManager.h
//  Giraffe
//
//  Created by yanpei on 1/2/16.
//
//

#import <Foundation/Foundation.h>
#import "YPSingleton.h"
#import "YpChannelsModel.h"

typedef void(^hotCallback) (NSArray<YpChannelModel*>*);

@interface YpHotManager : NSObject
YP_DECLEAR_AS_SINGLETON;

- (void)createDB;

- (void)addData:(YpChannelModel*)data;
- (void)removeData:(NSString*)ID;

- (void)readDataList:(hotCallback)callback;

@end
