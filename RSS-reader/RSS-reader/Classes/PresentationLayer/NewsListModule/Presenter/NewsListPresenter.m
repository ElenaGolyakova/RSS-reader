//
//  NewsListPresenter.m
//  RSS-reader
//
//  Created by Elena G on 11.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import "NewsListPresenter.h"
#import "NewsListViewInput.h"
#import "NewsListInteractorInput.h"

@implementation NewsListPresenter

#pragma mark - NewsListViewOutput

- (void)viewDidLoad {
    
    [self.view startActivityIndicator];
    
    [self.interactor loadNewsList];
    
}

-(void)willShowViewWithObject:(id)object{
    [self.interactor loadImageByObject:object];
}

-(void)didSelectTableViewCellWithIndexPath:(NSIndexPath *)indexPath selected:(BOOL)selected{
    
    if(selected) {
        
        [self.view deselectCellAtIndexPath:indexPath];
    }
    else {
        
        [self.view selectCellAtIndexPath:indexPath];
    }
}


#pragma mark - NewsListInteractorOutput

- (void)didLoadNewsList:(NSArray *)array {
    
    [self.view stopActivityIndicator];
    
    if(array.count > 0) {
        
        [self.view updateViewWithNewsArray:array];
    }
    else {
        
        [self.view showInfoViewWithText:@"Ничего не найдено"];
    }

}

- (void)didLoadNewsListWithError:(NSError *)error {
    
    [self.view stopActivityIndicator];
    
    [self.view showInfoViewWithText:error.localizedDescription];
    
}

- (void)didLoadImageByObject:(id)object{
    
    [self.view updateViewWithObject:object];
}




@end
