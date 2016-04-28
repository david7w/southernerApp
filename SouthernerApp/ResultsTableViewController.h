//
//  ResultsTableViewController.h
//  SouthernerApp
//
//  Created by David West on 2/27/16.
//  Copyright © 2016 David West. All rights reserved.
//

#import <UIKit/UIKit.h>
@import SafariServices;
#import "ArticlePost.h"
#import "WebViewController.h"
#import <AFNetworking.h>
#import <SDWebImageManager.h>

@interface ResultsTableViewController : UITableViewController
@property (nonatomic, strong) NSMutableArray *Posts;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSString *sectionURL;


- (void) creatPostArrayFromJsonData: (NSString*) jsonSource;

@end
