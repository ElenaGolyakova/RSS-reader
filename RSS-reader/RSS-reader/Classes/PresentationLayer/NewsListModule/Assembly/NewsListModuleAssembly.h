//
//  NewsListModuleAssembly.h
//  RSS-reader
//
//  Created by Elena G on 11.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NewsListViewController, NewsListPresenter, NewsListDataDisplayManager;

@interface NewsListModuleAssembly : NSObject

- (id)initWithView:(NewsListViewController*)viewController;

- (void)configure;

@end
