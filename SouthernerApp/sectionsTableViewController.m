//
//  sectionsTableViewController.m
//  SouthernerApp
//
//  Created by David West on 2/14/16.
//  Copyright © 2016 David West. All rights reserved.
//

#import "sectionsTableViewController.h"

@interface sectionsTableViewController ()

@end

@implementation sectionsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

 NSLog(@"preparing for segue: %@",segue.identifier);
    if ([segue.identifier  isEqual: @"shownews"]) {
        ArticlesBySection *newsSection = (ArticlesBySection *)segue.destinationViewController;
        newsSection.sectionURL = @"http://southerner.greatneck.k12.ny.us/?json=core.get_tag_posts&slug=news";
    } else if ([segue.identifier  isEqual: @"showop/ed"]) {
        ArticlesBySection *opEdSection = (ArticlesBySection *)segue.destinationViewController;
        opEdSection.sectionURL = @"http://southerner.greatneck.k12.ny.us/?json=core.get_tag_posts&slug=opinions";
    }
    else if ([segue.identifier  isEqual: @"showfeatures"]) {
        ArticlesBySection *opEdSection = (ArticlesBySection *)segue.destinationViewController;
        opEdSection.sectionURL = @"http://southerner.greatneck.k12.ny.us/?json=core.get_tag_posts&slug=features";
    }
    
    else if ([segue.identifier  isEqual: @"showspecialfeatures"]) {
            ArticlesBySection *opEdSection = (ArticlesBySection *)segue.destinationViewController;
            opEdSection.sectionURL = @"http://southerner.greatneck.k12.ny.us/?json=core.get_tag_posts&slug=special features";
    }
    
    else if ([segue.identifier  isEqual: @"showentertainment"]) {
            ArticlesBySection *opEdSection = (ArticlesBySection *)segue.destinationViewController;
            opEdSection.sectionURL = @"http://southerner.greatneck.k12.ny.us/?json=core.get_tag_posts&slug=entertainment";
    }
    
    else if ([segue.identifier  isEqual: @"showsports"]) {
            ArticlesBySection *opEdSection = (ArticlesBySection *)segue.destinationViewController;
            opEdSection.sectionURL = @"http://southerner.greatneck.k12.ny.us/?json=core.get_tag_posts&slug=sports";
    }
               

}
 
 // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.


@end
