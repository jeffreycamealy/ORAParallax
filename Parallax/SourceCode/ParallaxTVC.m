//
//  ParallaxTVC.m
//  Parallax
//
//  Created by Jeffrey Camealy on 1/23/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "ParallaxTVC.h"

@interface ParallaxTVC ()
- (float)horizontalOffsetForVerticalOffset:(NSInteger)verticalOffset cellRow:(NSUInteger)row;

@end

@implementation ParallaxTVC

#pragma mark - View Lifecycle

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self scrollViewDidScroll:nil];
}


#pragma mark - Private API

- (float)horizontalOffsetForVerticalOffset:(NSInteger)verticalOffset cellRow:(NSUInteger)row {
    const float startOfCurve = 170;
    const float scaleOfCurve = 23.0;
    float fraction = (verticalOffset-startOfCurve)/scaleOfCurve;
    
    return fraction < 0 ? 0 : powf(fraction, 2.0);
}


#pragma mark - Tableview Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %d", indexPath.row];
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
        float relativeOffset = cell.frame.origin.y - contentOffsetY;
//        cell.textLabel.frame = CGRectMake([self horizontalOffsetForVerticalOffset:relativeOffset], cell.textLabel.frame.origin.y,
    }
}

@end

































