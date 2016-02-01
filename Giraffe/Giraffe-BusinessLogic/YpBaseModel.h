//
//  YpBaseModel.h
//  Giraffe
//
//  Created by yanpei on 26/1/16.
//
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface YpBaseModel : JSONModel
@property (nonatomic, assign) int retcode;
@property (nonatomic, copy) NSString *retmsg;
@end
