//
//  SearchTableViewController.m
//  SouthernerApp
//
//  Created by David West on 8/16/15.
//  Copyright © 2015 David West. All rights reserved.
//

#import "SearchTableViewController.h"
@interface SearchTableViewController ()

@end

@implementation SearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    self.navigationItem.title = @"Search";
    _resultsTableViewController = [[ResultsTableViewController alloc] init];
    _searchController = [[UISearchController alloc] initWithSearchResultsController:self.resultsTableViewController];
    
    
    
    [self.resultsTableViewController.tableView registerClass:[UITableViewCell class]
                                      forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"cell"];//might need separate names for cells
    //
    
    
    
    // Use the current view controller to update the search results.
    self.searchController.searchResultsUpdater = self;
    
    [self.searchController.searchBar sizeToFit];
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    self.searchController.delegate = self;
    // we want to be the delegate for our filtered table so didSelectRowAtIndexPath is called for both tables
    self.resultsTableViewController.tableView.delegate = self;
    self.searchController.searchBar.delegate = self; // so we can monitor text changes + others
    
    self.clearsSelectionOnViewWillAppear = NO;
    
    
}
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    ///might want to pause app here for a few seconds right?
    // update the filtered array based on the search text
    //    NSLog(@"input = %@",self.searchController.searchBar.text);
    //
    //
    //    NSString *searchText = self.searchController.searchBar.text;
    //    NSLog(@"input = %@",self.searchController.searchBar.text);
    //    NSString *searchSyntax = @"https://southerner.greatneck.k12.ny.us/?json=get_search_results=";
    //    NSString *URL = [searchSyntax stringByAppendingString:searchText];
    //    [self.resultsTableViewController creatPostArrayFromJsonData:URL];
    //
    //    [self.resultsTableViewController.tableView reloadData];
    //
    //
    //
    //
    //    [self.searchController.searchBar resignFirstResponder];
    
}

-(void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    
    NSLog(@"input = %@",self.searchController.searchBar.text);
    
    
    NSString *searchText = self.searchController.searchBar.text;
    NSLog(@"input = %@",self.searchController.searchBar.text);
    NSString *searchSyntax = @"https://southerner.greatneck.k12.ny.us/?json=get_search_results=";
    NSString *URL = [searchSyntax stringByAppendingString:searchText];
    [self.resultsTableViewController creatPostArrayFromJsonData:URL];
    
    [self.resultsTableViewController.tableView reloadData];
    
    
    
    
    [searchBar resignFirstResponder];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.Posts count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    NSLog(@"loading");
    
    return cell;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ArticlePost *post = [self.resultsTableViewController.Posts objectAtIndex:indexPath.row];
    
    SFSafariViewController *safariVC= [[SFSafariViewController alloc] initWithURL:post.url];
    safariVC.delegate = self;
    
    [self presentViewController:safariVC animated:NO completion:nil];
    
}

//        ArticlePost *post = [self.Posts objectAtIndex:indexPath.row];


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
