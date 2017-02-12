//
//  NewsListDataDisplayManager.m
//  RSS-reader
//
//  Created by Elena G on 11.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import "NewsListDataDisplayManager.h"
#import "NewsTableViewCell.h"
#import "NewsDetailTableViewCell.h"
#import "NSIndexPath+Equal.h"
#import "NewsObject.h"

static CGFloat const kRowHeight =  55.0;
static CGFloat const kDetailRowHeight = 200.0;

static NSString *const kNewsCellReuseIdentifier = @"NewsCell";
static NSString *const kNewsDetailCellReuseIdentifier = @"NewsDetailCell";

@interface NewsListDataDisplayManager() <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, copy) NSArray *newsArray;
@property(nonatomic, strong) NSIndexPath *selectedIndexPath;

@end

@implementation NewsListDataDisplayManager

- (void)updateDataWithNews:(NSArray *)news {
    self.newsArray = news;
    self.selectedIndexPath = nil;
}

-(void)updateViewForItem:(id)item forTableView:(UITableView*)tableView{
    
    @synchronized (self.newsArray)
    {
        NSInteger index = [self.newsArray indexOfObject:item];
        if(index != NSNotFound){
            [tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
        }
    }
}

- (id<UITableViewDelegate>)delegateForTableView:(UITableView *)tableView {
    return self;
}

- (id<UITableViewDataSource>)dataSourceForTableView:(UITableView *)tableView {
    return self;
}

-(void)registerCellsForTableView:(UITableView*)tableView {
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([NewsTableViewCell class]) bundle:nil]
    forCellReuseIdentifier:kNewsCellReuseIdentifier];
    
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([NewsDetailTableViewCell class]) bundle:nil]
    forCellReuseIdentifier:kNewsDetailCellReuseIdentifier];
}

-(void)selectCellAtIndexPath:(NSIndexPath *)indexPath forTableView:(UITableView *)tableView {
    
    self.selectedIndexPath = indexPath;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void) deselectCellAtIndexPath:(NSIndexPath *)indexPath forTableView:(UITableView *)tableView {
    self.selectedIndexPath = nil;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = [self.selectedIndexPath isEqualToIndexPath:indexPath] ? kNewsDetailCellReuseIdentifier : kNewsCellReuseIdentifier;
    
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    NewsObject *object = self.newsArray[indexPath.row];
    [cell setTitle:object.title];
    [cell setImage:object.image];
    
    if([cell isKindOfClass:[NewsDetailTableViewCell class]]){
        [((NewsDetailTableViewCell*)cell) setDetailString:object.descriptionString];
    }
    
    [_delegate willShowCellWithObject:object];
    
    return cell;
}

#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.selectedIndexPath && indexPath.row == self.selectedIndexPath.row) {
        return kDetailRowHeight;
    }
    return kRowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [_delegate didSelectTableViewCellAtIndexPath:indexPath
                                        selected:[self.selectedIndexPath isEqualToIndexPath:indexPath]];
}



@end
