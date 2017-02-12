//
//  LaunchRouter.m
//  RSS-reader
//
//  Created by Elena G on 12.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import "LaunchRouter.h"
#import "NewsListModuleAssembly.h"
#import "NewsListViewController.h"

static NSString *kNewsListViewControllerID = @"NewsListViewControllerId";

@interface LaunchRouter()

@property(nonatomic, strong) UIWindow *window;
@property(nonatomic, strong) UIStoryboard *storyboard;
@property(nonatomic, strong) NSMutableArray *assemblies;

@end

@implementation LaunchRouter

- (instancetype)initWithWindow:(UIWindow *)window storyboard:(UIStoryboard*)storyboard{
    
    self = [super init];
    if(self) {
       
        self.window = window;
        self.storyboard = storyboard;
        self.assemblies = [NSMutableArray array];
       
    }
    return self;
}

-(void)configure {

    NewsListViewController *newsListViewController = nil;
    
    UINavigationController *navController = (UINavigationController*)[self.window rootViewController];
    if([navController isKindOfClass:[UINavigationController class]]) {
        
        if([[navController topViewController] isKindOfClass:[NewsListViewController class]]) {
            
            newsListViewController = (NewsListViewController*)[navController topViewController];
        }
    }
    
    if(!newsListViewController) {
        
        newsListViewController = (NewsListViewController*)[self.storyboard instantiateViewControllerWithIdentifier:kNewsListViewControllerID];
        navController = [[UINavigationController alloc] initWithRootViewController:newsListViewController];
        
        self.window.rootViewController = navController;
        [self.window makeKeyAndVisible];
    }
    
    NewsListModuleAssembly *assembly = [[NewsListModuleAssembly alloc] initWithView:newsListViewController];
    [assembly configure];
    
    [self.assemblies addObject:assembly];
    
}


@end
