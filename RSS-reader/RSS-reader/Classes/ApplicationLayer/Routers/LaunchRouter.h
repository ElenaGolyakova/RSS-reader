//
//  NewsLaunchRouter.h
//  RSS-reader
//
//  Created by Elena G on 12.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LaunchRouter : NSObject

- (instancetype)initWithWindow:(UIWindow *)window storyboard:(UIStoryboard*)storyboard;

- (void)configure;

@end
