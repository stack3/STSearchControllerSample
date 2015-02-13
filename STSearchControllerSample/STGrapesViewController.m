//
//  ViewController.m
//  STSearchControllerSample
//
//  Created by EIMEI on 2015/02/04.
//  Copyright (c) 2015年 Stack3. All rights reserved.
//

#import "STGrapesViewController.h"
#import "STGrapeSearchResultsController.h"

@interface STGrapesViewController () <UITableViewDataSource, UISearchBarDelegate, UISearchControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *grapes;
@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) STGrapeSearchResultsController *searchResultsController;

@end

@implementation STGrapesViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _grapes = [NSMutableArray arrayWithCapacity:100];
    [_grapes addObject:@"Cabernet Sauvignon"];
    [_grapes addObject:@"Merlot"];
    [_grapes addObject:@"Pino Noir"];
    [_grapes addObject:@"Chardonnay"];
    [_grapes addObject:@"Sauvignon Blanc"];
    [_grapes addObject:@"Riesling"];

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _searchResultsController = [sb instantiateViewControllerWithIdentifier:@"STGrapeSearchResultsController"];
    _searchResultsController.allGrapes = _grapes;

    _searchController = [[UISearchController alloc] initWithSearchResultsController:_searchResultsController];
    _searchController.searchBar.frame = CGRectMake(0, 0, self.view.bounds.size.width, 44);
    _searchController.searchBar.returnKeyType = UIReturnKeyDone;
    _searchController.searchBar.placeholder = @"Search";
    _searchController.searchBar.delegate = self;
    //_searchController.delegate = self;

    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    _tableView.dataSource = self;
    _tableView.tableHeaderView = _searchController.searchBar;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _grapes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *row = [_grapes objectAtIndex:indexPath.row];

    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    cell.textLabel.text = row;

    return cell;
}

#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [_searchResultsController query:searchText];
}

@end
