//
//  Layer3DataSource.m
//  Parallax
//
//  Created by Jeffrey Camealy on 2/8/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "Layer3TVDD.h"
#import "ParallaxItemsCell.h"

#define ScreenHeight 548

@interface Layer3TVDD () {
    NSArray *cells;
}
- (NSArray *)makeCells;
@end


@implementation Layer3TVDD

NSInit(
    cells = [self makeCells];
);


#pragma mark - Private API

- (NSArray *)makeCells {
    UITableViewCell *dummyCell = [[ParallaxItemsCell alloc] init];
    [dummyCell setFrameHeight:ScreenHeight*2];
//    dummyCell.contentView.backgroundColor = [UIColor colorWithRed:50 green:50 blue:50 alpha:0.3];
    
    ParallaxItemsCell *phoneItemCell = [[ParallaxItemsCell alloc] initWithNibName:@"PhoneItemsCell"];
    [phoneItemCell setFrameHeight:ScreenHeight*2];
//    phoneItemCell.contentView.backgroundColor = [UIColor colorWithRed:50 green:50 blue:255 alpha:0.8];
    
    ParallaxItemsCell *cameraItemsCell = [[ParallaxItemsCell alloc] initWithNibName:@"CameraItemsCell"];
    [cameraItemsCell setFrameHeight:ScreenHeight*2];
//    cameraItemsCell.contentView.backgroundColor = [UIColor colorWithRed:50 green:255 blue:50 alpha:0.3];
    
    return @[dummyCell, phoneItemCell, cameraItemsCell];
}

#pragma mark - Tableview Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return cells[indexPath.row];
}


#pragma mark - Tableview Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [cells[indexPath.row] frame].size.height;
}

@end
































