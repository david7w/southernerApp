//
//  LoginViewController.h
//  SouthernerApp
//
//  Created by David West on 8/24/15.
//  Copyright © 2015 David West. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface LoginViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *usernameField;

@property (strong, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)login:(id)sender;

@end
