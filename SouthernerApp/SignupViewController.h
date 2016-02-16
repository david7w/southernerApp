//
//  SignupViewController.h
//  SouthernerApp
//
//  Created by David West on 8/24/15.
//  Copyright © 2015 David West. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface SignupViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *usernameField;

@property (strong, nonatomic) IBOutlet UITextField *passwordField;

@property (strong, nonatomic) IBOutlet UITextField *emailField;

- (IBAction)signup:(id)sender;



@end
