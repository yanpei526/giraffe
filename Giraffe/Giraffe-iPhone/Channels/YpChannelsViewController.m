//
//  YpChannelsViewController.m
//  Giraffe
//
//  Created by yanpei on 25/1/16.
//
//

#import "YpChannelsViewController.h"
#import "YpChannelsManager.h"
#import "YpChannelInfoViewController.h"
#import "UIKit+AFNetworking.h"
#import "YpHotManager.h"
#import "UIImageView+WebCache.h"

@interface YpChannelsViewController () <UITableViewDelegate, UITableViewDataSource>
{
    YpChannelsManager    *_manager;
    UITableView         *_tableView;
}
@end

@implementation YpChannelsViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"频道";
        
        UITabBarItem *item = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:0];
        self.tabBarItem = item;
        
        _manager = [[YpChannelsManager alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    _tableView = tableView;
    
    [self updateData];
}

- (void)updateData
{
    [_manager request:^(YpBaseModel *model, NSError *error) {
        if (error || model.retcode != 200) {
            
        } else {
            [_tableView reloadData];
        }
    }];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YpChannelModel *model = [_manager.channelList.channels objectAtIndex:indexPath.row];
    YpChannelInfoViewController *vc = [[YpChannelInfoViewController alloc] init];
    [vc setData:model];
    [self.navigationController pushViewController:vc animated:YES];
    
    [[YpHotManager sharedInstance] addData:model];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _manager.channelList.channels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tableCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!tableCell) {
        tableCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    YpChannelModel *model = [_manager.channelList.channels objectAtIndex:indexPath.row];
    tableCell.textLabel.text = model.name;
    [tableCell.imageView sd_setImageWithURL:[NSURL URLWithString:model.icon1]];
    return tableCell;
}

@end
