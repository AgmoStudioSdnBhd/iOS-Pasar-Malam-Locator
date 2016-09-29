//
//  DataSource.m
//  Pasar Malam Locator
//
//  Created by Chui Wei Wai on 14/09/2016.
//  Copyright © 2016 Chui Wei Wai. All rights reserved.
//

#import "DataSource.h"
@import Firebase;

@implementation DataSource

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    if ([self count] != 0) {
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        tableView.backgroundView   =  nil;
    }
    return [self count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    UILabel *noDataLabel         = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, tableView.bounds.size.height)];
    noDataLabel.text             = @"No posts yet - why not add one?";
    noDataLabel.textColor        = [UIColor blackColor];
    noDataLabel.textAlignment    = NSTextAlignmentCenter;
    tableView.backgroundView = noDataLabel;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return 1;
}
@end
