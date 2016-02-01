//
//  YpDBTool.m
//  Giraffe
//
//  Created by yanpei on 1/2/16.
//
//

#import "YpDBTool.h"

@implementation YpDBTool

+ (NSString*)DBPathWithFileName:(NSString*)fileName
{
    static NSString *dbPath;
    
    if (!dbPath) {
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        dbPath = [NSString stringWithFormat:@"%@/DB", [paths objectAtIndex:0]];
        BOOL pathResult;
        NSError *pathErr;
        BOOL isPath;
        BOOL result = [[NSFileManager defaultManager] fileExistsAtPath:dbPath isDirectory:&isPath];
        if (!result) {
            pathResult = [[NSFileManager defaultManager] createDirectoryAtPath:dbPath
                                                   withIntermediateDirectories:YES
                                                                    attributes:nil
                                                                         error:&pathErr];
        }
    }
    
    NSString *pathName = [NSString stringWithFormat:@"%@/%@", dbPath, fileName];
    return pathName;
}

@end
