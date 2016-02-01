//
//  YpPersonalInfoViewController.m
//  Giraffe
//
//  Created by yanpei on 25/1/16.
//
//

#import "YpPersonalInfoViewController.h"

@interface YpPersonalInfoViewController ()

@end

@implementation YpPersonalInfoViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"个人详情";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}


@end
