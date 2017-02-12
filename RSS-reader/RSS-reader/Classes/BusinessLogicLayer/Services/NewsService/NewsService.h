//
//  NewsService.h
//  RSS-reader
//
//  Created by Elena G on 12.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

@protocol NewsService <NSObject>

-(void)loadNewsList:(void (^)(NSArray*array, NSError*))completionBlock;

@end
