//
//  NewsListViewController.m
//  RSS-reader
//
//  Created by Elena G on 11.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import "NewsListViewController.h"
#import "NewsListViewOutput.h"


@interface NewsListViewController ()

@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, weak) IBOutlet UILabel *infoLabel;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation NewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.output viewDidLoad];
    [self.dataDisplayManager registerCellsForTableView:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NewsListViewInput

- (void)startActivityIndicator {
    
    [_activityIndicator startAnimating];
}

- (void)stopActivityIndicator {
    
    [_activityIndicator stopAnimating];
}

- (void)updateViewWithNewsArray:(NSArray*)newsArray {
    
    self.tableView.delegate = [self.dataDisplayManager delegateForTableView:self.tableView];
    self.tableView.dataSource = [self.dataDisplayManager dataSourceForTableView:self.tableView];
    
    [self.dataDisplayManager updateDataWithNews:newsArray];
    
    [self.tableView reloadData];
}

- (void)showInfoViewWithText:(NSString*)text{
    
    self.infoLabel.hidden = NO;
    self.infoLabel.text = text;
}

- (void)hideInfoView {
    
    self.infoLabel.hidden = YES;
}

- (void)selectCellAtIndexPath:(NSIndexPath *)indexPath {
    [self.dataDisplayManager selectCellAtIndexPath:indexPath forTableView:self.tableView];
}

- (void)deselectCellAtIndexPath:(NSIndexPath *)indexPath {
    [self.dataDisplayManager deselectCellAtIndexPath:indexPath forTableView:self.tableView];
}

-(void)updateViewWithObject:(id)object{
    
    [self.dataDisplayManager updateViewForItem:object forTableView:self.tableView];
}

#pragma mark -NewsListDataDisplayManagerDelegate

-(void)didSelectTableViewCellAtIndexPath:(NSIndexPath *)indexPath selected:(BOOL)selected{
    
    [self.output didSelectTableViewCellWithIndexPath:indexPath selected:selected];
}

-(void)willShowCellWithObject:(NSObject *)object{
    
    [self.output willShowViewWithObject:object];
}

@end
