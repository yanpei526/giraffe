//
//  ChannelInfoModel.h
//  Giraffe
//
//  Created by yanpei on 28/1/16.
//
//

#import "YpBaseModel.h"

@protocol YpChannelBlockModel <NSObject>
@end

@interface YpChannelBlockModel : JSONModel
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *name;
@end

@interface YpChannelInfoModel : YpBaseModel
@property (nonatomic, strong) NSArray<YpChannelBlockModel, Optional> *blocks;
@end
