//
//  SavedTableViewController.h
//  SouthernerApp
//
//  Created by David West on 8/17/15.
//  Copyright © 2015 David West. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SavedTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@end
