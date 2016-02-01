//
//  YpHotManager.m
//  Giraffe
//
//  Created by yanpei on 1/2/16.
//
//

#import "YpHotManager.h"
#import "FMDatabase.h"
#import "YpDBTool.h"

@interface YpHotManager ()
{
    
}
@property (nonatomic, strong) FMDatabase    *database;
@end

@implementation YpHotManager
YP_IMPLEMENT_SINGLETON(YpHotManager);

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createDB];
    }
    return self;
}

- (void)addData:(YpChannelModel*)data
{
    if ([self.database open]) {
        [self.database executeUpdate:@"insert into hot(ID, name, icon1) values(?,?,?)", data.ID, data.name, data.icon1];
        [self.database close];
    }
}

- (void)removeData:(NSString*)ID
{
    if ([self.database open]) {
        [self.database executeUpdate:@"delete from hot where ID=?", ID];
        [self.database close];
    }
}

- (void)readDataList:(hotCallback)callback
{
    NSMutableArray<YpChannelModel*>* list = [[NSMutableArray alloc] init];
    
    if ([self.database open]) {
        FMResultSet* set = [self.database executeQuery:@"select * from hot"];
        
        while ([set next]) {
            YpChannelModel *model = [[YpChannelModel alloc] init];
            model.ID = [set stringForColumn:@"ID"];
            model.name = [set stringForColumn:@"name"];
            model.icon1 = [set stringForColumn:@"icon1"];
            [list addObject:model];
        }
        [self.database close];
        
        if (callback) {
            callback(list);
        }
    }
}

- (FMDatabase*)database
{
    if (!_database) {
        _database = [[FMDatabase alloc] initWithPath:[YpDBTool DBPathWithFileName:@"hot"]];
    }
    return _database;
}

- (void)createDB
{
    if ([self.database open]) {
        [self.database executeUpdate:@"CREATE TABLE IF NOT EXISTS 'hot' ('index' INTEGER PRIMARY KEY AUTOINCREMENT, 'ID' TEXT, 'name' TEXT, 'icon1' TEXT)"];
        [self.database close];
    }
}

@end
