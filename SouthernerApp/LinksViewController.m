//
//  LinksViewController.m
//  SouthernerApp
//
//  Created by David West on 4/24/16.
//  Copyright © 2016 David West. All rights reserved.
//

#import "LinksViewController.h"

@interface LinksViewController ()

@end

@implementation LinksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)openSchoolWebsite:(id)sender {
    self.safariVC= [[SFSafariViewController alloc]
                    initWithURL:[NSURL URLWithString:@"http://greatnecksouth.weebly.com"] entersReaderIfAvailable:YES];
    self.safariVC.delegate = self;
    
    [self presentViewController:self.safariVC animated:NO completion:nil];
    
    
}
- (IBAction)openSchoolPhoneNumbers:(id)sender {
    
    self.safariVC= [[SFSafariViewController alloc]
                    initWithURL:[NSURL URLWithString:@"http://greatnecksouth.weebly.com/phone-numbers.html"] entersReaderIfAvailable:YES];
    self.safariVC.delegate = self;
    
    [self presentViewController:self.safariVC animated:NO completion:nil];
    
}
- (IBAction)openMorningAnnouncements:(id)sender {
    self.safariVC= [[SFSafariViewController alloc]
                    initWithURL:[NSURL URLWithString:@"http://greatnecksouth.weebly.com/announcements.html"] entersReaderIfAvailable:YES];
    self.safariVC.delegate = self;
    
    [self presentViewController:self.safariVC animated:NO completion:nil];
    
}
- (IBAction)openABSchedule:(id)sender {
    self.safariVC= [[SFSafariViewController alloc]
                    initWithURL:[NSURL URLWithString:@"http://www.greatneck.k12.ny.us/GNPS/SHS/15-16%20A%20B%20Rotation.pdf"] entersReaderIfAvailable:YES];
    self.safariVC.delegate = self;
    
    [self presentViewController:self.safariVC animated:NO completion:nil];
    
}
- (IBAction)openWhatsHappening:(id)sender {
    self.safariVC= [[SFSafariViewController alloc]
                    initWithURL:[NSURL URLWithString:@"http://www.greatneck.k12.ny.us/GNPS/SHS/whatshappening/index.htm"] entersReaderIfAvailable:YES];
    self.safariVC.delegate = self;
    
    [self presentViewController:self.safariVC animated:NO completion:nil];
    
}
- (IBAction)openBellSchedule:(id)sender {
    self.safariVC= [[SFSafariViewController alloc]
                    initWithURL:[NSURL URLWithString:@"http://www.greatneck.k12.ny.us/GNPS/SHS/newschedule.htm"] entersReaderIfAvailable:YES];
    self.safariVC.delegate = self;
    
    [self presentViewController:self.safariVC animated:NO completion:nil];
    
}
- (IBAction)openTeacherWebsites:(id)sender {
    self.safariVC= [[SFSafariViewController alloc]
                    initWithURL:[NSURL URLWithString:@"http://www.greatneck.k12.ny.us/GNPS/SHS/tws/index.htm"] entersReaderIfAvailable:YES];
    self.safariVC.delegate = self;
    
    [self presentViewController:self.safariVC animated:NO completion:nil];
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
