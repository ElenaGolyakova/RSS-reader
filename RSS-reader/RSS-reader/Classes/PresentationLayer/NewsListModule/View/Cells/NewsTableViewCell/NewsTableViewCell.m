//
//  NewsTableViewCell.m
//  RSS-reader
//
//  Created by Elena G on 11.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import "NewsTableViewCell.h"

@interface NewsTableViewCell()

@property(nonatomic, weak) IBOutlet UILabel *customTitleLabel;
@property(nonatomic, weak) IBOutlet UIImageView *customImageView;

@end

@implementation NewsTableViewCell

-(void)setTitle:(NSString *)title{
    self.customTitleLabel.text = title;
}

-(void)setImage:(UIImage *)image{
    self.customImageView.image = image;
}

@end
