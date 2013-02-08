//
//  Layer2TVDD.m
//  Parallax
//
//  Created by Jeffrey Camealy on 2/8/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "Layer2TVDD.h"

#define ScreenHeight 548

@interface Layer2TVDD () {
    NSArray *cells;
}
- (NSArray *)makeCells;
@end


@implementation Layer2TVDD

NSInit(
    cells = [self makeCells];
);


#pragma mark - Private API

- (NSArray *)makeCells {
    NSArray *imageNames = @[@"iphone_model", @"detailBlock1", @"detailBlock2", @"detailBlock3", @"detailBlock4"];
    NSMutableArray *tempCells = [NSMutableArray array];
    
    // Add first label
    UITableViewCell *labelCell = [[UITableViewCell alloc] init];
    [labelCell setFrameHeight:ScreenHeight];
    UILabel *label = [[UILabel alloc] init];
    label.text = @"Welcome.  Scroll to learn.";
    [label sizeToFit];
    label.backgroundColor = [UIColor clearColor];
    label.center = CGPointMake(labelCell.frame.size.width/2, labelCell.frame.size.height/2);
    [labelCell addSubview:label];
    [tempCells addObject:labelCell];
    
    // Add images
    for (NSString *imageName in imageNames) {
        UIImageView *imageView = [UIImageView imageViewWithImageNamed:imageName];
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        [cell setFrameHeight:ScreenHeight];
        imageView.center = CGPointMake(cell.frame.size.width/2, cell.frame.size.height/2);
        [cell addSubview:imageView];
        [tempCells addObject:cell];
    }
    
    return [tempCells copy];
}

#pragma mark - Tableview Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = cells[indexPath.row];
//    if (indexPath.row%2) {
//        cell.contentView.backgroundColor = [UIColor colorWithRed:0.1 green:0.2 blue:0.9 alpha:0.5];
//    } else {
//        cell.contentView.backgroundColor = [UIColor colorWithRed:0.3 green:0.9 blue:0.1 alpha:0.5];
//    }
    return cell;
}


#pragma mark - Tableview Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [cells[indexPath.row] frame].size.height;
}

@end
