//
//  MoreNavigationViewController.m
//  SouthernerApp
//
//  Created by David West on 4/23/16.
//  Copyright © 2016 David West. All rights reserved.
//

#import "MoreNavigationViewController.h"

@interface MoreNavigationViewController ()

@end

@implementation MoreNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    NSURL *aboutPageURL= [NSURL URLWithString:@"http://southerner.greatneck.k12.ny.us/?page_id=4108"];
    SFSafariViewController *safariVC= [[SFSafariViewController alloc]
                                       initWithURL:aboutPageURL entersReaderIfAvailable:YES];
    safariVC.delegate = self;
    
    [self presentViewController:safariVC animated:NO completion:nil];
    
    
    
    
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
