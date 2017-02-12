//
//  NewsListInteractor.h
//  RSS-reader
//
//  Created by Elena G on 11.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsListInteractorInput.h"
#import "NewsListInteractorOutput.h"
#import "ImageLoadService.h"
#import "ImageLoadServiceDelegate.h"

@protocol NewsListInteractorOutput, NewsService, SortService;

@interface NewsListInteractor : NSObject <NewsListInteractorInput, ImageLoadServiceDelegate>

@property (nonatomic, weak) id <NewsListInteractorOutput> output;
@property (nonatomic, strong) id <NewsService> newsService;
@property (nonatomic, strong) id <SortService> sortService;
@property (nonatomic, strong) id <ImageLoadService> imageLoadService;


@end
