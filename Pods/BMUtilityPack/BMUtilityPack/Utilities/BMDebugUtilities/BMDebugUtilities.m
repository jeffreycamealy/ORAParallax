//
//  BMDebugUtilities.m
//  ClipsButton
//
//  Created by Jeffrey Camealy on 12/22/12.
//  Copyright (c) 2012 bearMountain. All rights reserved.
//

#import "BMDebugUtilities.h"

@implementation BMDebugUtilities

NSString *NSStringForViewFrame(UIView *view) {
    return NSStringFromCGRect(view.frame);
}

NSString *NSStringForViewBounds(UIView *view) {
    return NSStringFromCGRect(view.bounds);
}

@end
