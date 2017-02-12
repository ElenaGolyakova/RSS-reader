//
//  NewsListDataDisplayManager.h
//  RSS-reader
//
//  Created by Elena G on 11.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NewsListDataDisplayManagerDelegate

- (void)didSelectTableViewCellAtIndexPath:(NSIndexPath *)indexPath selected:(BOOL)selected;
- (void)willShowCellWithObject:(NSObject*)object;

@end


@interface NewsListDataDisplayManager : NSObject

@property (nonatomic, weak) id <NewsListDataDisplayManagerDelegate> delegate;


- (void)updateDataWithNews:(NSArray *)news;
- (void)updateViewForItem:(id)item forTableView:(UITableView*)tableView;

- (id<UITableViewDelegate>)delegateForTableView:(UITableView *)tableView;

- (id<UITableViewDataSource>)dataSourceForTableView:(UITableView *)tableView;

- (void)registerCellsForTableView:(UITableView*)tableView;

- (void)selectCellAtIndexPath:(NSIndexPath*)indexPath forTableView:(UITableView *)tableView;

- (void)deselectCellAtIndexPath:(NSIndexPath*)indexPath forTableView:(UITableView *)tableView;


@end
