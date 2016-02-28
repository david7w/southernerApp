//
//  ArticlesBySection.h
//  SouthernerApp
//
//  Created by David West on 8/15/15.
//  Copyright © 2015 David West. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticlePost.h"
#import "WebViewController.h"
#import <AFNetworking.h>
#import <SDWebImageManager.h>
#import <Parse/Parse.h>
#import "SectionsTableViewController.h"
@interface ArticleGenerator : UITableViewController

@property (nonatomic, strong) NSMutableArray *Posts;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSString *sectionURL;


- (void) creatPostArrayFromJsonData: (NSString*) jsonSource;
- (void)refresh:(UIRefreshControl *)refreshControl ;

@end
