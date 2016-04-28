//
//  LinksViewController.h
//  SouthernerApp
//
//  Created by David West on 4/24/16.
//  Copyright © 2016 David West. All rights reserved.
//

#import <UIKit/UIKit.h>
@import SafariServices;
@interface LinksViewController : UIViewController

<SFSafariViewControllerDelegate>

@property (nonatomic, strong) NSURL* pageURL;
@property (nonatomic, strong) SFSafariViewController *safariVC;


@end
