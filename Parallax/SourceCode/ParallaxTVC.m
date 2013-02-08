//
//  ParallaxTVC.m
//  Parallax
//
//  Created by Jeffrey Camealy on 1/23/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "ParallaxTVC.h"
#import "ParallaxItemsCell.h"
#import "Layer3TVDD.h"
#import "Layer2TVDD.h"

#define NumPages 5
#define ScreenHeight 548


@interface ParallaxTVC () {
    Layer2TVDD *layer2TVDD;
    Layer3TVDD *layer3TVDD;
    BOOL pageAnimating;
}
- (void)updateLayer2ForVerticalOffset:(float)verticalOffset;
- (void)updateLayer3ForVerticalOffset:(float)verticalOffset;
- (float)hotSpotOffsetForVerticalOffset:(float)verticalOffset;
@end


@implementation ParallaxTVC

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UserTouchSrollView
    self.userTouchScrollView.contentSize = CGSizeMake(320, NumPages*2*self.view.frame.size.height);
    self.userTouchScrollView.decelerationRate = UIScrollViewDecelerationRateNormal*10;
    
    // Layer2
    layer2TVDD = [[Layer2TVDD alloc] init];
    self.layer2TableView.dataSource = layer2TVDD;
    self.layer2TableView.delegate = layer2TVDD;
    
    // Layer3
    layer3TVDD = [[Layer3TVDD alloc] init];
    self.layer3TableView.dataSource = layer3TVDD;
    self.layer3TableView.delegate = layer3TVDD;
}


#pragma mark - Private API

- (void)updateLayer2ForVerticalOffset:(float)verticalOffset {
    float layer2Ratio = 1.0/2;
    self.layer2TableView.contentOffset =  CGPointMake(0, verticalOffset*layer2Ratio);
}

- (void)updateLayer3ForVerticalOffset:(float)verticalOffset {
    self.layer3TableView.contentOffset = CGPointMake(0, verticalOffset);
    
    for (ParallaxItemsCell *visibleCell in [self.layer3TableView visibleCells]) {
        float relativeOffset = visibleCell.frame.origin.y - verticalOffset;
        [visibleCell offsetItemsForVerticalOffset:relativeOffset];
    }
}

//
// o: vertOffset
// H: height between hotspots
// D: length of hotspot
// q: quadrant (H+D segment)
// s: start of next hotspot
//
#define H ScreenHeight*2
#define D 150
//
- (float)hotSpotOffsetForVerticalOffset:(float)verticalOffset {
    float o  = self.userTouchScrollView.contentOffset.y;
    float q = ceilf(o/(H+D));
    float s = (q * H) + (q-1) * D;
    
    float hotSpotOffset = 0;
    if (q < 1) {
        hotSpotOffset = o;
    }
    else if (o > s) {
        hotSpotOffset = q*H;
    }
    else {
        hotSpotOffset = o - (q-1)*D;
    }
    
//    NSLog(@"o:%f, q:%f, s:%f, hot:%f", o,q,s,hotSpotOffset);
    return hotSpotOffset;
}


#pragma mark - ScrollViewDelegate Method

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    float hotSpotOffset = [self hotSpotOffsetForVerticalOffset:scrollView.contentOffset.y];
    
    [self updateLayer2ForVerticalOffset:hotSpotOffset];
    [self updateLayer3ForVerticalOffset:hotSpotOffset];
}

@end

































