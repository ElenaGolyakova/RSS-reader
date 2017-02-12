//
//  NewsListPresenter.h
//  RSS-reader
//
//  Created by Elena G on 11.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsListInteractorOutput.h"
#import "NewsListViewOutput.h"

@protocol NewsListViewInput, NewsListInteractorInput;

@interface NewsListPresenter : NSObject <NewsListViewOutput, NewsListInteractorOutput>

@property (nonatomic, weak) id <NewsListViewInput> view;
@property (nonatomic, weak) id <NewsListInteractorInput> interactor;

@end
