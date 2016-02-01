//
//  YpHTTPManager.h
//  Giraffe
//
//  Created by yanpei on 28/1/16.
//
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface YpHTTPManager : AFHTTPSessionManager
+ (instancetype)sharedInstance;
@end
