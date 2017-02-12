//
//  NewsListInteractorOutput.h
//  RSS-reader
//
//  Created by Elena G on 11.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

@protocol NewsListInteractorOutput <NSObject>

- (void)didLoadNewsList:(NSArray*)array;
- (void)didLoadNewsListWithError:(NSError*)error;
- (void)didLoadImageByObject:(id)object;

@end

