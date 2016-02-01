//
//  YpBaseManager.h
//  Giraffe
//
//  Created by yanpei on 28/1/16.
//
//

#import <Foundation/Foundation.h>
#import "YpBaseModel.h"

typedef void (^managerCallback)(YpBaseModel *model, NSError *error);

@interface YpNetBaseManager : NSObject
{
    NSURLSessionDataTask    *_dataTask;
}

- (NSURLSessionDataTask*)requestUrl:(NSString*)url
                             params:(NSDictionary*)params
                         modelClass:(Class)modelClass
                           callback:(managerCallback)callback;
- (void)cancel;

@end
