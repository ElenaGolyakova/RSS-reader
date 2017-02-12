//
//  NewsListViewOutput.h
//  RSS-reader
//
//  Created by Elena G on 11.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

@protocol NewsListViewOutput <NSObject>

- (void)viewDidLoad;
- (void)didSelectTableViewCellWithIndexPath:(NSIndexPath*)indexPath selected:(BOOL)selected;
- (void)willShowViewWithObject:(id)object;

@end
