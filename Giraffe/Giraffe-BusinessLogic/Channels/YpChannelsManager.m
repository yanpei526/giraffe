//
//  YpChannelManager.m
//  Giraffe
//
//  Created by yanpei on 25/1/16.
//
//

#import "YpChannelsManager.h"
#import "AFNetworking.h"
#import "JSONHTTPClient.h"
#import "AFURLResponseSerialization.h"
#import "YpChannelsModel.h"
#import "YpHTTPManager.h"

@interface YpChannelsManager ()
{
}
@end

@implementation YpChannelsManager

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)request:(managerCallback)callback
{
    callback = [callback copy];
    
    NSString *urlString = @"http://po.funshion.com/v5/config/channel";
    
    [self requestUrl:urlString params:nil modelClass:[YpChannelsModel class] callback:^(YpBaseModel *model, NSError *error) {
        if ([model isKindOfClass:[YpChannelsModel class]]) {
            _channelList = (YpChannelsModel*)model;
        } else {
            _channelList = nil;
        }
        if (callback) {
            callback(_channelList, error);
        }
    }];
}


#pragma mark -

//- (void)requestUrl:(NSString*)urlString
//{
////    NSURLSessionConfiguration;
////    NSHTTPCookieStorage;
////    NSURLCache;
////    NSURLCredentialStorage;
//    
////    NSUInteger a = [NSURLCache sharedURLCache].memoryCapacity;
////    NSUInteger b = [NSURLCache sharedURLCache].currentMemoryUsage;
////    NSUInteger c = [NSURLCache sharedURLCache].diskCapacity;
////    NSUInteger d = [NSURLCache sharedURLCache].currentDiskUsage;
////    NSLog(@"%d  %d  %d  %d", a, b, c, d);
//    
//    NSURL *url = [NSURL URLWithString:urlString];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:10];
//    NSURLSessionDataTask *task
//    = [[NSURLSession sharedSession] dataTaskWithRequest:request
//                                      completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//                                          NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
////                                          NSLog(responseString);
//    }];
//    [task resume];
//}
//
//- (void)requestUrl2:(NSString*)urlString
//{
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    NSMutableSet *contentTypes = [NSMutableSet setWithSet:manager.responseSerializer.acceptableContentTypes];
//    [contentTypes addObject:@"text/html"];
//    manager.responseSerializer.acceptableContentTypes = contentTypes;
//    
//    NSURL *URL = [NSURL URLWithString:urlString];
//    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
//    
//    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request
//                                                completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
//                                                    if (error) {
//                                                        NSLog(@"Error: %@", error);
//                                                    } else {
//                                                        NSLog(@"%@ %@", response, responseObject);
//                                                    }
//                                                }];
//    [dataTask resume];
//}
@end
