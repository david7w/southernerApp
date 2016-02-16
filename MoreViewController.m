//
//  MoreViewController.m
//  SouthernerApp
//
//  Created by David West on 8/24/15.
//  Copyright © 2015 David West. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        NSLog(@"Current user: %@", currentUser.username);
    }
    else {
        [self performSegueWithIdentifier:@"showLogin" sender:self];
    }}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
 if ([segue.identifier isEqualToString:@"showLogin"]) {
 [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
 }
 }


@end
