//
//  NewsListViewInput.h
//  RSS-reader
//
//  Created by Elena G on 11.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

@protocol NewsListViewInput <NSObject>

- (void)startActivityIndicator;
- (void)stopActivityIndicator;

- (void)updateViewWithNewsArray:(NSArray*)newsArray;
- (void)showInfoViewWithText:(NSString*)text;

- (void)hideInfoView;

- (void)selectCellAtIndexPath:(NSIndexPath*)indexPath;
- (void)deselectCellAtIndexPath:(NSIndexPath*)indexPath;

- (void)updateViewWithObject:(id)object;

@end
