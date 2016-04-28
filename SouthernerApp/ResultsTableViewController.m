//
//  ResultsTableViewController.m
//  SouthernerApp
//
//  Created by David West on 2/27/16.
//  Copyright © 2016 David West. All rights reserved.
//

#import "ResultsTableViewController.h"

@interface ResultsTableViewController ()

@end

@implementation ResultsTableViewController

- (void) creatPostArrayFromJsonData:jsonSource {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:jsonSource parameters:nil success:^(AFHTTPRequestOperation *operation, id jsonData) {
        
        self.Posts = [NSMutableArray array];
        NSDictionary *dataDictionary = jsonData;
        NSArray *blogPostsArray = [dataDictionary objectForKey:@"posts"];
        
        for (NSDictionary *bpDictionary in blogPostsArray) {
            ArticlePost *blogPost = [ArticlePost blogPostWithTitle:[bpDictionary objectForKey:@"title"]];
            NSDictionary *authorDict =  [bpDictionary objectForKey:@"author"];
            blogPost.author = [authorDict objectForKey:@"name"];
            blogPost.thumbnail = [bpDictionary objectForKey:@"thumbnail"];
            blogPost.date = [bpDictionary objectForKey:@"date"];
            blogPost.url = [NSURL URLWithString:[bpDictionary objectForKey:@"url"]];
            [self.Posts addObject:blogPost];
        }
        
        [self.tableView reloadData];
    }
     
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    //self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.Posts count];
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
             NSLog(@"i should be loading");
         }
                                                          completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished)
         {
             if (image && finished)
             {
                 cell.imageView.image = image;
                 [cell setNeedsLayout];
                 
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


#pragma mark - Navigation

//In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //    if ([segue.identifier isEqualToString:@"showSearchedArticle"]){
    //        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    //        ArticlePost *post = [self.Posts objectAtIndex:indexPath.row];
    //
    //        SFSafariViewController *safariVC= [SFSafariViewController alloc];
    //        [safariVC initWithURL:post.url];
    //        safariVC.delegate = self;
    //
    //        [self presentViewController:safariVC animated:NO completion:nil];
    
    //        WebViewController *wbc = (WebViewController *)segue.destinationViewController;
    //        wbc.blogPostURL = post.url;
    
    //}
    
    
    
    
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}







@end
