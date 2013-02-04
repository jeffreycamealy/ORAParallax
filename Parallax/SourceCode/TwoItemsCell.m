//
//  TwoItemsCell.m
//  Parallax
//
//  Created by Jeffrey Camealy on 2/4/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "TwoItemsCell.h"

@interface TwoItemsCell () {
    CGPoint item1Goal;
    CGPoint item2Goal;
}
- (void)commonSetup;
- (float)horizontalOffsetForVerticalOffset:(float)verticalOffset;
@end

@implementation TwoItemsCell

#pragma mark - Init Method

#pragma mark - Init Method

#pragma mark - Init Method

- (id)init {
    if (self = [super init]) {
        [self commonSetup];
    }
    return self;
}

- (id)initWithNibName:(NSString*)name {
    self = (TwoItemsCell *)rootViewFromNibNamed(name);
    item1Goal = self.item1.frame.origin;
    item2Goal = self.item2.frame.origin;
    [self commonSetup];
    return self;
}

- (void)commonSetup {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}


#pragma mark - Public API

- (void)offsetItemsForVerticalOffset:(float)verticalOffset {
    float horizontalOffset = [self horizontalOffsetForVerticalOffset:verticalOffset];
    
    [self.item1 setFrameOriginX:-horizontalOffset+item1Goal.x];
    [self.item2 setFrameOriginX:horizontalOffset+item2Goal.x];
}


#pragma mark - Private API

- (float)horizontalOffsetForVerticalOffset:(float)verticalOffset {
    const float startOfCurve = 200;
    const float scaleOfCurve = 23;
    float fraction = (verticalOffset-startOfCurve)/scaleOfCurve;
    float horizontalOffset = fraction < 0 ? 0 : powf(fraction, 2.0);
    return horizontalOffset;
}

@end
































