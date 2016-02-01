//
//  YpChannelsModel.h
//  Giraffe
//
//  Created by yanpei on 25/1/16.
//
//

#import <Foundation/Foundation.h>
#import "YpBaseModel.h"

@protocol YpChannelModel <NSObject>
@end

@interface YpChannelModel : JSONModel
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *template;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *icon1;
@property (nonatomic, strong) NSString *icon2;
@property (nonatomic, strong) NSString *url;
@end

@interface YpChannelsModel : YpBaseModel
@property (nonatomic, strong) NSArray<YpChannelModel, Optional> *channels;
@end
