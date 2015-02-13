//
//  STGrapeSearchResultsController.h
//  STSearchControllerSample
//
//  Created by EIMEI on 2015/02/04.
//  Copyright (c) 2015年 Stack3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STGrapeSearchResultsController : UIViewController

@property (strong, nonatomic) NSArray *allGrapes;
@property (strong, nonatomic, readonly) NSMutableArray *searchedGrapes;

- (void)query:(NSString *)query;

@end
