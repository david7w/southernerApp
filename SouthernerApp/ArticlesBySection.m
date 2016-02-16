//
//  ArticlesBySection.m
//  SouthernerApp
//
//  Created by David West on 8/15/15.
//  Copyright © 2015 David West. All rights reserved.
//

#import "ArticlesBySection.h"

@interface ArticlesBySection ()

@end

@implementation ArticlesBySection

//use this to get section articles : http://southerner.greatneck.k12.ny.us/?json=core.get_tag_posts&slug=news


- (void) creatPostArrayFromJsonData:jsonSource {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:jsonSource parameters:nil success:^(AFHTTPRequestOperation *operation, id jsonData) {
        
        self.Posts = [NSMutableArray array];
        NSDictionary *dataDictionary = jsonData;
        NSArray *blogPostsArray = [dataDictionary objectForKey:@"posts"];
        
        for (NSDictionary *bpDictionary in blogPostsArray) {
            ArticlePost *blogPost = [ArticlePost blogPostWithTitle:[bpDictionary objectForKey:@"title"]];
            blogPost.author = [bpDictionary objectForKey:@"author"];
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

- (void)refresh:(UIRefreshControl *)refreshControl {
    [self creatPostArrayFromJsonData: _sectionURL];
    [refreshControl endRefreshing];
}
/*- (IBAction)tappedSaveData:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue: @"" forKey:@"post"];
    [defaults synchronize];
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];

    [self creatPostArrayFromJsonData: _sectionURL];
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor orangeColor];
    self.refreshControl.tintColor = [UIColor whiteColor];
    [self.refreshControl addTarget:self
                            action:@selector(refresh:)
                  forControlEvents:UIControlEventValueChanged];
    self.dataArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"myTxtList"];

};



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.Posts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
  //  cell.heightAnchor = 60;
    
   /* UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //set the position of the button
    button.frame = CGRectMake(150.0f, 5.0f, 150.0f, 30.0f);
    [button setTitle:@"Save" forState:UIControlStateNormal];
    //[button addTarget:self action:@selector(/*saveArticle:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor= [UIColor clearColor];
    [cell addSubview:button];*/
    

    
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

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

    NSLog(@"preparing for segue: %@",segue.identifier);
    
    if ([segue.identifier isEqualToString:@"showBlogPost"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ArticlePost *post = [self.Posts objectAtIndex:indexPath.row];
        WebViewController *wbc = (WebViewController *)segue.destinationViewController;
        wbc.blogPostURL = post.url;
        
    }
    
 }


@end
