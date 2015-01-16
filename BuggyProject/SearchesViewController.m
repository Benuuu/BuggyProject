//
//  SearchesViewController.m
//  BuggyProject
//
//  Created by Benjamin Wu on 1/16/15.
//  Copyright (c) 2015 Intrepid Pursuits. All rights reserved.
//

#import "SearchesViewController.h"

static NSString * const kSearchCellIdentifier = @"kSearchCellIdentifier";

@interface SearchesViewController () <UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *searchTableView;

@end

@implementation SearchesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kSearchCellIdentifier];
}

#pragma mark - Actions

- (IBAction)byeButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searches.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSearchCellIdentifier];
    cell.textLabel.text = self.searches[indexPath.row];
    return cell;
}

@end
