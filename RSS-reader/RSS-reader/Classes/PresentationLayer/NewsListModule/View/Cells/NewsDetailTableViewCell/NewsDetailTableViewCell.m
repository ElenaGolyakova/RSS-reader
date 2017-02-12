//
//  NewsDetailTableViewCell.m
//  RSS-reader
//
//  Created by Elena G on 11.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import "NewsDetailTableViewCell.h"

@interface NewsDetailTableViewCell()

@property(nonatomic, weak) IBOutlet UILabel *customDetailLabel;

@end

@implementation NewsDetailTableViewCell

-(void)setDetailString:(NSString *)detailString{
    self.customDetailLabel.text = detailString;
}

@end
