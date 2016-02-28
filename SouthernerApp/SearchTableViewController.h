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

@interface SearchTableViewController : UITableViewController
<UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) NSMutableArray *Posts;



@end
//uitableviewdatasource, uitableviewdelegate