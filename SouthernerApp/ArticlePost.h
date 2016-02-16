//
//  ArticlePost.h
//  SouthernerApp
//
//  Created by David West on 8/15/15.
//  Copyright © 2015 David West. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArticlePost : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSURL *url;

- (id) initWithTitle:(NSString *)title;
+ (id) blogPostWithTitle:(NSString *)title;

- (NSURL *) thumbnailURL;
- (NSString *) formattedDate;



@end
