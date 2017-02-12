//
//  NewsListInteractorInput.h
//  RSS-reader
//
//  Created by Elena G on 11.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

@protocol NewsListInteractorInput <NSObject>

- (void)loadNewsList;
- (void)loadImageByObject:(id)object;

@end
