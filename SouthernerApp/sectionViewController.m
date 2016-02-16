//
//  sectionViewController.m
//  SouthernerApp
//
//  Created by David West on 2/14/16.
//  Copyright © 2016 David West. All rights reserved.
//

#import "sectionViewController.h"

@interface sectionViewController ()

@end

@implementation sectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:NO];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
   
 
 if ([segue.identifier  isEqual: @"shownews"]) {
        ArticlesBySection *newsSection = (ArticlesBySection *)segue.destinationViewController;
        newsSection.sectionURL = @"http://southerner.greatneck.k12.ny.us/?json=core.get_tag_posts&slug=news";
    } else if ([segue.identifier  isEqual: @"showopinions/editorials"]) {
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
 // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
