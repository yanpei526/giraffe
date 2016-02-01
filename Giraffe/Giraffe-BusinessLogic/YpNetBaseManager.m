//
//  YpBaseManager.m
//  Giraffe
//
//  Created by yanpei on 28/1/16.
//
//

#import "YpNetBaseManager.h"
#import "YpHTTPManager.h"

@interface YpNetBaseManager ()

@end

@implementation YpNetBaseManager

- (NSURLSessionDataTask*)requestUrl:(NSString*)urlString
                             params:(NSDictionary*)params
                         modelClass:(Class)modelClass
                           callback:(managerCallback)callback
{
    callback = [callback copy];
    
    NSURLSessionDataTask *dataTask
    = [[YpHTTPManager sharedInstance] GET:urlString
                               parameters:params
                                 progress:^(NSProgress * _Nonnull downloadProgress)
       {
           NSLog(@"progress: %@", downloadProgress);
       }
                                  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
       {
           NSError *modelError;
           YpBaseModel *model = [[modelClass alloc] initWithDictionary:(NSDictionary*)responseObject error:&modelError];
           if (callback) {
               callback(model, modelError);
           }
       }
                                  failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
       {
           if (callback) {
               callback(nil, error);
           }
       }];

    _dataTask = dataTask;
    return dataTask;
}

- (void)cancel
{
    [_dataTask cancel];
}

@end
