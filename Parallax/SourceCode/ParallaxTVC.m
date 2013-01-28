//
//  ParallaxTVC.m
//  Parallax
//
//  Created by Jeffrey Camealy on 1/23/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "ParallaxTVC.h"

@interface ParallaxTVC ()
- (float)horizontalOffsetForVerticalOffset:(NSInteger)verticalOffset;

@end

@implementation ParallaxTVC

#pragma mark - View Lifecycle

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self scrollViewDidScroll:nil];
}


#pragma mark - Private API

- (float)horizontalOffsetForVerticalOffset:(NSInteger)verticalOffset {
    float fraction = (verticalOffset-170)/23.0;
    if (fraction < 0) {
        return 0;
    } else {
        return powf(fraction, 2.0);
    }
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
    for (UITableViewCell *cell in [self.tableView visibleCells]) {
        float relativeOffset = cell.frame.origin.y - contentOffsetY;
        cell.textLabel.frame = CGRectMake([self horizontalOffsetForVerticalOffset:relativeOffset], cell.textLabel.frame.origin.y,
                                          cell.textLabel.frame.size.width, cell.textLabel.frame.size.height);
    }
}


@end

































