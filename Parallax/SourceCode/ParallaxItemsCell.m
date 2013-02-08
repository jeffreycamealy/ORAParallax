//
//  TwoItemsCell.m
//  Parallax
//
//  Created by Jeffrey Camealy on 2/4/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "ParallaxItemsCell.h"

#define ScreenHeight 460

@interface ParallaxItemsCell () {
    CGPoint item1Goal;
    CGPoint item2Goal;
    CGPoint itemMiddleGoal;
    float largetPossibleHorizontalOffset;
}
- (void)commonSetup;
- (float)horizontalOffsetForVerticalOffset:(float)verticalOffset;
- (void)offset1And2ForVerticalOffset:(float)verticalOffset;
- (void)offsetCenterItemForVerticalOffset:(float)verticalOffset;
@end

@implementation ParallaxItemsCell

#pragma mark - Init Methods

NSInit(
    [self commonSetup];
);

- (id)initWithNibName:(NSString*)name {
    self = (ParallaxItemsCell *)rootViewFromNibNamed(name);
    item1Goal = self.item1.frame.origin;
    item2Goal = self.item2.frame.origin;
    itemMiddleGoal = self.itemMiddle.frame.origin;
    self.centeringView.backgroundColor = [UIColor clearColor];
    [self commonSetup];
    return self;
}

- (void)commonSetup {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    largetPossibleHorizontalOffset = [self horizontalOffsetForVerticalOffset:ScreenHeight];
}


- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    // Center in top half
    self.centeringView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/4);
}

#pragma mark - Public API

- (void)offsetItemsForVerticalOffset:(float)verticalOffset {
    [self offset1And2ForVerticalOffset:verticalOffset];
    [self offsetCenterItemForVerticalOffset:verticalOffset];
}

- (void)offset1And2ForVerticalOffset:(float)verticalOffset {
    float horizontalOffset = [self horizontalOffsetForVerticalOffset:verticalOffset];
    [self.item1 setFrameOriginX:-horizontalOffset+item1Goal.x];
    [self.item2 setFrameOriginX:horizontalOffset+item2Goal.x];
}

- (void)offsetCenterItemForVerticalOffset:(float)verticalOffset {
    float targetY = 210;
    float lenghtOfAlphaFade = 60;
    float cameraVertOffset = -verticalOffset+itemMiddleGoal.y+targetY;
    
    // Vertical Movement
    if (cameraVertOffset < itemMiddleGoal.y) {
        [self.itemMiddle setFrameOriginY:cameraVertOffset];
    }
    
    // Alpha
    float targetOffset = ScreenHeight-targetY;
    float startTarget = targetOffset+lenghtOfAlphaFade;
    float alpha = 0;
    if (verticalOffset < targetOffset) { // above
        alpha = 1;
    }
    else if (verticalOffset > startTarget) { // below
        alpha = 0;
    }
    else { // transitioning
        alpha = (startTarget-verticalOffset)/lenghtOfAlphaFade;
    }
    self.itemMiddle.alpha = alpha;
}


#pragma mark - Private API

- (float)horizontalOffsetForVerticalOffset:(float)verticalOffset {
    const float startOfCurve = 275;
    const float scaleOfCurve = 23;
    float fraction = (verticalOffset-startOfCurve)/scaleOfCurve;
    float horizontalOffset = fraction < 0 ? 0 : powf(fraction, 2.0);
    return horizontalOffset;
}

@end
































