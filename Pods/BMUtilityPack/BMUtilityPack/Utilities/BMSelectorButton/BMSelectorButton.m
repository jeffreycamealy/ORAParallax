//
//  BMSelectorButton.m
//  BMUtilityPack
//
//  Created by Jeffrey Camealy on 12/19/12.
//  Copyright (c) 2012 bearMountain. All rights reserved.
//

#import "BMSelectorButton.h"
#import "BMInitMacros.h"

@interface BMSelectorButton ()
- (void)buttonTouched;
@end

@implementation BMSelectorButton

UIViewCommonInit(
     // Target Action
     [self addTarget:self action:@selector(buttonTouched) forControlEvents:UIControlEventTouchDown];
     
     // Make (Highlighted|Selected) = Selected
     NSUInteger HighlightedAndSelected = (UIControlStateHighlighted|UIControlStateSelected);
     [self setBackgroundImage:[self backgroundImageForState:UIControlStateSelected] forState:HighlightedAndSelected];
     [self setImage:[self imageForState:UIControlStateSelected] forState:HighlightedAndSelected];
     [self setTitle:[self titleForState:UIControlStateSelected] forState:HighlightedAndSelected];
     [self setTitleColor:[self titleColorForState:UIControlStateSelected] forState:HighlightedAndSelected];
);


#pragma mark - Private API

- (void)buttonTouched {
    self.selected = !self.selected;
}

@end
































