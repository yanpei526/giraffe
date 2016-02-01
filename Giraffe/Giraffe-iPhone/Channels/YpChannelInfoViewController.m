//
//  YpChannelInfoViewController.m
//  Giraffe
//
//  Created by yanpei on 29/1/16.
//
//

#import "YpChannelInfoViewController.h"
#import "YpChannelInfoManager.h"

@interface YpChannelInfoViewController () <UITableViewDelegate, UITableViewDataSource>
{
    YpChannelModel          *_enterData;
    YpChannelInfoManager    *_manager;
    UITableView             *_tableView;
}
@end

@implementation YpChannelInfoViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _manager = [[YpChannelInfoManager alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 100;
    [self.view addSubview:tableView];
    _tableView = tableView;
    
    [self updateData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

- (void)setData:(YpChannelModel*)data
{
    _enterData = data;
    self.title = data.name;
}

#pragma mark -

- (void)updateData
{
    [_manager requestWithChannelID:_enterData.ID
                          callback:^(YpBaseModel *model, NSError *error) {
                              if (error || model.retcode != 200) {
                                  
                              } else {
                                  [_tableView reloadData];
                              }
    }];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _manager.channelInfo.blocks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tableCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!tableCell) {
        YpChannelBlockModel *model = [_manager.channelInfo.blocks objectAtIndex:indexPath.row];
        tableCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        tableCell.textLabel.text = model.name;
        tableCell.textLabel.backgroundColor = [UIColor grayColor];
    }
    return tableCell;
}

@end
