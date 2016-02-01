//
//  YpHTTPManager.m
//  Giraffe
//
//  Created by yanpei on 28/1/16.
//
//

#import "YpHTTPManager.h"

@implementation YpHTTPManager

+ (instancetype)sharedInstance
{
    static YpHTTPManager *s_instance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        s_instance = [[YpHTTPManager alloc] init];
        
        NSMutableSet *contentTypes = [NSMutableSet setWithSet:s_instance.responseSerializer.acceptableContentTypes];
        [contentTypes addObject:@"text/html"];
        s_instance.responseSerializer.acceptableContentTypes = contentTypes;
        
        s_instance.requestSerializer.cachePolicy = NSURLRequestReturnCacheDataElseLoad;
    });
    
    return s_instance;
}

@end
