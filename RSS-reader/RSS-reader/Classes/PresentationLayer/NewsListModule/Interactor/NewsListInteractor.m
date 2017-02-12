//
//  NewsListInteractor.m
//  RSS-reader
//
//  Created by Elena G on 11.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import "NewsListInteractor.h"
#import "NewsListInteractorOutput.h"
#import "NewsService.h"
#import "SortService.h"
#import "NewsObject.h"

@implementation NewsListInteractor

#pragma mark - NewsListInteractorInput

- (void)loadNewsList{
    
    [self.newsService loadNewsList:^(NSArray *array, NSError *error){
       
        if(error) {
            [self.output didLoadNewsListWithError:error];
        }
        else {
            
            NSArray *sortedArray = [self.sortService sortByDate:array];
            [self.output didLoadNewsList:sortedArray];
        }
    }];
    
}

-(void)loadImageByObject:(id)object{
    
    [self.imageLoadService loadImageByObject:object];
}

#pragma mark - ImageLoadServiceDelegate

-(void)didLoadImageByObject:(id)object{
    
    [self.output didLoadImageByObject:object];
}

@end
