//
//  YpHotViewController.m
//  Giraffe
//
//  Created by yanpei on 25/1/16.
//
//

#import "YpHotViewController.h"
#import "YpHotManager.h"
#import "UIKit+AFNetworking.h"
#import "YpChannelInfoViewController.h"
#import "UIImageView+WebCache.h"

@interface YpHotViewController () <UITableViewDelegate, UITableViewDataSource>
{
    UITableView         *_tableView;
    NSArray<YpChannelModel*>   *_dataSource;
}
@end

@implementation YpHotViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"热点";
        
        UITabBarItem *item = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:0];
        self.tabBarItem = item;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    _tableView = tableView;
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self updateData];
}

- (void)updateData
{
    [[YpHotManager sharedInstance] readDataList:^(NSArray<YpChannelModel *> *data) {
        _dataSource = data;
        [_tableView reloadData];
    }];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YpChannelModel *model = [_dataSource objectAtIndex:indexPath.row];
    YpChannelInfoViewController *vc = [[YpChannelInfoViewController alloc] init];
    [vc setData:model];
    [self.navigationController pushViewController:vc animated:YES];
    
    [[YpHotManager sharedInstance] removeData:model.ID];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tableCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!tableCell) {
        tableCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    YpChannelModel *model = [_dataSource objectAtIndex:indexPath.row];
    tableCell.textLabel.text = model.name;
//    [tableCell.imageView setImageWithURL:[NSURL URLWithString:model.icon1]];
    [tableCell.imageView sd_setImageWithURL:[NSURL URLWithString:model.icon1]];

    return tableCell;
}

@end
