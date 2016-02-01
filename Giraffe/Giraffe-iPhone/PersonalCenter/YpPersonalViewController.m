//
//  YpPersonalViewController.m
//  Giraffe
//
//  Created by yanpei on 25/1/16.
//
//

#import "YpPersonalViewController.h"
#import "YpPersonalInfoViewController.h"

@interface YpPersonalViewController ()

@end

@implementation YpPersonalViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"个人中心";
        
        UITabBarItem *item = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
        self.tabBarItem = item;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(200, 200, 100, 50)];
    [btn setTitle:@"个人详情" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(moreInfoBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)moreInfoBtnClicked
{
    YpPersonalInfoViewController *vc = [[YpPersonalInfoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
