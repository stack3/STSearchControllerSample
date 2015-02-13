//
//  STGrapeSearchResultsController.m
//  STSearchControllerSample
//
//  Created by EIMEI on 2015/02/04.
//  Copyright (c) 2015年 Stack3. All rights reserved.
//

#import "STGrapeSearchResultsController.h"

@interface STGrapeSearchResultsController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation STGrapeSearchResultsController

- (void)viewDidLoad {
    [super viewDidLoad];

    _searchedGrapes = [NSMutableArray arrayWithCapacity:10];

    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    _tableView.dataSource = self;
}

- (void)query:(NSString *)query {
    [_searchedGrapes removeAllObjects];
    for (NSString *grape in _allGrapes) {
        NSRange range = [grape rangeOfString:query];
        if (range.location != NSNotFound) {
            [_searchedGrapes addObject:grape];
        }
    }
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _searchedGrapes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *row = [_searchedGrapes objectAtIndex:indexPath.row];
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = row;
    return cell;
}

@end
