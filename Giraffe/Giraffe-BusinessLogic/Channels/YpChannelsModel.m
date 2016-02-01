//
//  YpChannelsModel.m
//  Giraffe
//
//  Created by yanpei on 25/1/16.
//
//

#import "YpChannelsModel.h"

@implementation YpChannelModel
+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id": @"ID"}];
}
@end

@implementation YpChannelsModel

@end
