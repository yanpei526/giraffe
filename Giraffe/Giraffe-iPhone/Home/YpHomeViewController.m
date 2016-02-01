//
//  YpHomeViewController.m
//  Giraffe
//
//  Created by yanpei on 19/1/16.
//
//

#import "YpHomeViewController.h"
#import "YpChannelsViewController.h"
#import "YpHotViewController.h"
#import "YpPersonalViewController.h"

@interface YpHomeViewController () <UITabBarControllerDelegate>

@end

@implementation YpHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    self.delegate = self;
    self.viewControllers = @[[[YpChannelsViewController alloc] init], [[YpHotViewController alloc] init], [[YpPersonalViewController alloc] init]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - UITabBarControllerDelegate


@end
