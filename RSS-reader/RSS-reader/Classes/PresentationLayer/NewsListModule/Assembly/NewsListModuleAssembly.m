//
//  NewsListModuleAssembly.m
//  RSS-reader
//
//  Created by Elena G on 11.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import "NewsListModuleAssembly.h"
#import "NewsListViewController.h"
#import "NewsListPresenter.h"
#import "NewsListInteractor.h"
#import "NewsServiceImplementation.h"
#import "SortServiceImplementation.h"
#import "ImageLoadServiceImplementation.h"

@interface NewsListModuleAssembly()

@property(nonatomic, strong) NewsListViewController *view;
@property(nonatomic, strong) NewsListPresenter *presenter;
@property(nonatomic, strong) NewsListInteractor *interactor;

@end

@implementation NewsListModuleAssembly

-(instancetype)initWithView:(NewsListViewController *)viewController {
    
    self = [super init];
    if (self) {
        
        self.view = viewController;
        
    }
    return self;
}

-(void)configure {

    self.presenter = [[NewsListPresenter alloc] init];

    self.interactor = [[NewsListInteractor alloc] init];
    
    NewsListDataDisplayManager *dataDisplayManager = [[NewsListDataDisplayManager alloc] init];
    dataDisplayManager.delegate = _view;
    
    self.view.output = _presenter;
    self.view.dataDisplayManager = dataDisplayManager;

    _presenter.view = _view;
    _presenter.interactor = _interactor;
    
    _interactor.output = self.presenter;
    _interactor.newsService = [[NewsServiceImplementation alloc] init];
    _interactor.sortService = [[SortServiceImplementation alloc] init];
    
    ImageLoadServiceImplementation *imageLoadService = [[ImageLoadServiceImplementation alloc] init];
    imageLoadService.delegate = _interactor;
    
    _interactor.imageLoadService = imageLoadService;
    
}




@end
