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
//    [super viewDidLoad];
//    NSString *userInput = self.searchBar.text;
//    NSLog(@"Input: %@", userInput);
//    NSString *searchSyntax = @"southerner.greatneck.k12.ny.us/?json_route=/posts?filter[s]";
//    NSString *backendInput = [searchSyntax stringByAppendingString:userInput];
//
//    ArticlesBySection *dataRaw = [[ArticlesBySection alloc] init];
//    [dataRaw creatPostArrayFromJsonData:backendInput];
//    self.Posts = dataRaw.Posts;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    
    self.searchBar.delegate = self;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


-(void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"input = %@",self.searchBar.text);
    
    [searchBar resignFirstResponder];
    
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    ArticlePost *blogPost = [self.Posts objectAtIndex:indexPath.row];
    
    //asynch image request
    if ([blogPost.thumbnail isKindOfClass:[NSString class]]) {
        [SDWebImageDownloader.sharedDownloader downloadImageWithURL:blogPost.thumbnailURL
                                                            options:0
                                                           progress:^(NSInteger receivedSize, NSInteger expectedSize)
         {
             // progression tracking code
         }
                                                          completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished)
         {
             if (image && finished)
             {
                 cell.imageView.image = image;
             }
         }];
    } else {
        cell.imageView.image = [UIImage imageNamed:@"Paper_tableview.png"];
    }
    
    cell.textLabel.text = blogPost.title;
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@",blogPost.author,[blogPost formattedDate]];
    
    return cell;
}


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
