//
//  SearchTableViewController.h
//  SouthernerApp
//
//  Created by David West on 8/16/15.
//  Copyright © 2015 David West. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleGenerator.h"
#import "ArticlePost.h"
#import "ResultsTableViewController.h"

@interface SearchTableViewController : UITableViewController
<UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating, SFSafariViewControllerDelegate>

@property (nonatomic, strong) UISearchController *searchController;

@property (nonatomic, strong) NSMutableArray *Posts;
@property (nonatomic, strong) ResultsTableViewController *resultsTableViewController;


@end
//uitableviewdatasource, uitableviewdelegate