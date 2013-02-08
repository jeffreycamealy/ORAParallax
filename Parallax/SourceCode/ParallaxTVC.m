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

#define ImageCell_ID @"ImageCell"
#define TextCell_ID @"TextCell"
#define NumPages 5
#define ScreenHeight 548


@interface ParallaxTVC () {
    NSMutableArray *hotSpots;
    Layer3TVDD *layer3DataSource;
}
- (float)horizontalOffsetForVerticalOffset:(NSInteger)verticalOffset cell:(UITableViewCell*)cell cellRow:(NSUInteger)row;
- (void)setupLayer2;
- (void)updateLayer2ForVerticalOffset:(float)verticalOffset;
- (void)updateLayer3ForVerticalOffset:(float)verticalOffset;
- (float)hotSpotOffsetForVerticalOffset:(float)verticalOffset;
@end


@implementation ParallaxTVC

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLayer2];
    self.scrollView.contentSize = CGSizeMake(320, NumPages*2*self.view.frame.size.height);
    layer3DataSource = [[Layer3TVDD alloc] init];
    self.tableView.dataSource = layer3DataSource;
    self.tableView.delegate = layer3DataSource;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self scrollViewDidScroll:nil]; // Setup any visible offsets
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

- (void)setupLayer2 {
    float viewWidth = self.view.bounds.size.width;
    float viewHeight = self.view.bounds.size.height;
    
    hotSpots = [NSMutableArray array];
    NSArray *itemsImageNames = @[@"iphone_model", @"detailBlock1", @"detailBlock2", @"detailBlock3", @"detailBlock4"];
    [self.layer2 setFrameHeight:viewHeight*NumPages];
    for (int i = 0; i < NumPages; i++) {
        UIImageView *itemImageView = [UIImageView imageViewWithImageNamed:itemsImageNames[i]];
        itemImageView.center = CGPointMake(viewWidth/2, viewHeight/2 + viewHeight*(i+1));
        [self.layer2 addSubview:itemImageView];
    }
}

- (void)updateLayer2ForVerticalOffset:(float)verticalOffset {
    float layer2Ratio = 1.0/2;
    [self.layer2 setFrameOriginY:-verticalOffset*layer2Ratio];
}

- (void)updateLayer3ForVerticalOffset:(float)verticalOffset {
    for (ParallaxItemsCell *visibleCell in [self.tableView visibleCells]) {
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
    float o  = self.scrollView.contentOffset.y;
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
    
    NSLog(@"o:%f, q:%f, s:%f, hot:%f", o,q,s,hotSpotOffset);
    return hotSpotOffset;
}


#pragma mark - ScrollViewDelegate Method

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.scrollView) {
        float hotSpotOffset = [self hotSpotOffsetForVerticalOffset:self.scrollView.contentOffset.y];
        
        self.tableView.contentOffset = CGPointMake(0, hotSpotOffset);
        [self updateLayer2ForVerticalOffset:hotSpotOffset];
        [self updateLayer3ForVerticalOffset:hotSpotOffset];
    }
}

@end

































