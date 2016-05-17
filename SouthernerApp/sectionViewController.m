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

    self.navigationItem.title = @"Select a Section";
    // Do any additional setup after loading the view.
    
    
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    //// Image Declarations
    UIImage* mascot = [UIImage imageNamed: @"mascot.png"];
    
    //// Picture Drawing
    UIBezierPath* picturePath = [UIBezierPath bezierPathWithRect: CGRectMake(70, 19, 94, 75)];
    CGContextSaveGState(context);
    [picturePath addClip];
    [mascot drawInRect: CGRectMake(70, 19, mascot.size.width, mascot.size.height)];
    CGContextRestoreGState(context);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
   
 
 if ([segue.identifier  isEqual: @"shownews"]) {
        ArticleGenerator *newsSection = (ArticleGenerator *)segue.destinationViewController;
        newsSection.sectionURL = @"http://southerner.greatneck.k12.ny.us/?json=core.get_tag_posts&slug=news";
     newsSection.navigationItem.title = @"Recent News Articles";
    } else if ([segue.identifier  isEqual: @"showopinions/editorials"]) {
        ArticleGenerator *opEdSection = (ArticleGenerator *)segue.destinationViewController;
        opEdSection.sectionURL = @"http://southerner.greatneck.k12.ny.us/?json=core.get_tag_posts&slug=opinions";
        opEdSection.navigationItem.title = @"Recent Opinion and Editorial Pieces";
    }
    else if ([segue.identifier  isEqual: @"showfeatures"]) {
        ArticleGenerator *features = (ArticleGenerator *)segue.destinationViewController;
        features.sectionURL = @"http://southerner.greatneck.k12.ny.us/?json=core.get_tag_posts&slug=features";
        features.navigationItem.title = @"Recent Features Articles";
    }
    
    else if ([segue.identifier  isEqual: @"showspecialfeatures"]) {
            ArticleGenerator *specialFeatures = (ArticleGenerator *)segue.destinationViewController;
            specialFeatures.sectionURL = @"http://southerner.greatneck.k12.ny.us/?json=core.get_tag_posts&slug=special features";
        specialFeatures.navigationItem.title = @"Recent Feature Articles";
    }
    
    else if ([segue.identifier  isEqual: @"showentertainment"]) {
            ArticleGenerator *entertainment = (ArticleGenerator *)segue.destinationViewController;
            entertainment.sectionURL = @"http://southerner.greatneck.k12.ny.us/?json=core.get_tag_posts&slug=entertainment";
        entertainment.navigationItem.title = @"Recent Entertainment Articles";
    }
    
    else if ([segue.identifier  isEqual: @"showsports"]) {
            ArticleGenerator *sports = (ArticleGenerator *)segue.destinationViewController;
            sports.sectionURL = @"http://southerner.greatneck.k12.ny.us/?json=core.get_tag_posts&slug=sports";
        sports.navigationItem.title  = @"Recent Sports Articles";
    }
 // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
