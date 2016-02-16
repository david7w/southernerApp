//
//  ArticleNavigationController.m
//  SouthernerApp
//
//  Created by David West on 8/16/15.
//  Copyright © 2015 David West. All rights reserved.
//

#import "ArticleNavigationController.h"

@interface ArticleNavigationController ()

@end

@implementation ArticleNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    UIColor *southOrange = [UIColor orangeColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:southOrange};
  
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
