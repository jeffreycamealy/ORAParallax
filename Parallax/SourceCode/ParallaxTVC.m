//
//  ParallaxTVC.m
//  Parallax
//
//  Created by Jeffrey Camealy on 1/23/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "ParallaxTVC.h"

#define ImageCell_ID @"ImageCell"
#define TextCell_ID @"TextCell"

@interface ParallaxTVC ()
- (float)horizontalOffsetForVerticalOffset:(NSInteger)verticalOffset cell:(UITableViewCell*)cell cellRow:(NSUInteger)row;
@end


@implementation ParallaxTVC

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNibNamed:@"PhotoCell" forCellReuseIdentifier:ImageCell_ID];
    [self.tableView registerNibNamed:@"TextCell" forCellReuseIdentifier:TextCell_ID];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self scrollViewDidScroll:nil];
}


#pragma mark - Private API

- (float)horizontalOffsetForVerticalOffset:(NSInteger)verticalOffset cell:(UITableViewCell *)cell cellRow:(NSUInteger)row {
    const float startOfCurve = 200;
    const float scaleOfCurve = 23;
    float fraction = (verticalOffset-startOfCurve)/scaleOfCurve;
    float horizontalOffset = fraction < 0 ? 0 : powf(fraction, 2.0);
    int relativeRow = row%3;
    float alternatedOffset = relativeRow==0 ? horizontalOffset : -horizontalOffset;
    return alternatedOffset + self.tableView.frame.size.width/2 - cell.frame.size.width/2;
}


#pragma mark - Tableview Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row%3) {
        case 0:
            return 200;
            
        case 1:
            return 120;
            
        case 2:
            return 200;
    }
    
    // Not reachable
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    int relativeRow = indexPath.row%3;
    
    switch (relativeRow) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:ImageCell_ID];
            break;
        
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:TextCell_ID];
            break;
            
        case 2:
            cell = [[UITableViewCell alloc] init];
    }
    
    cell.tag = indexPath.row;
    return cell;
}


#pragma mark - Tableview Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}


#pragma mark - ScrollViewDelegate Method

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    float contentOffsetY = self.tableView.contentOffset.y;
    
    // Clouds
    float cloudsRatio = 1.0/10;
    self.cloudsView.frame = CGRectMake(0, -contentOffsetY*cloudsRatio,
                                       self.cloudsView.frame.size.width, self.cloudsView.frame.size.height);
    
    // Cell
    NSArray *visibleCells = [self.tableView visibleCells];
    for (int i = 0; i<visibleCells.count; i++) {
        UITableViewCell *cell = visibleCells[i];
        float relativeOffset = cell.frame.origin.y - contentOffsetY;
        float cellOffset = [self horizontalOffsetForVerticalOffset:relativeOffset cell:cell cellRow:cell.tag];
        [cell setFrameOriginX:cellOffset];
    }
}

@end

































