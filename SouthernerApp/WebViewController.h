//
//  WebViewController.h
//  SouthernerApp
//
//  Created by David West on 8/15/15.
//  Copyright © 2015 David West. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (strong, nonatomic) NSURL *blogPostURL;

@property (strong, nonatomic) IBOutlet UIWebView *webView;



@end
