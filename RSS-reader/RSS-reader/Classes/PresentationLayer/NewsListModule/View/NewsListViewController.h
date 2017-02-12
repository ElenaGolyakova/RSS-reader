//
//  NewsListViewController.h
//  RSS-reader
//
//  Created by Elena G on 11.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import "NewsListViewInput.h"
#import "NewsListDataDisplayManager.h"

@class NewsListDataDisplayManager;
@protocol NewsListViewOutput;

@interface NewsListViewController : UIViewController <NewsListViewInput, NewsListDataDisplayManagerDelegate>

@property (nonatomic, weak) id <NewsListViewOutput> output;
@property (nonatomic, strong) NewsListDataDisplayManager *dataDisplayManager;

@end
