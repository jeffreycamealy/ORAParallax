//
//  BMNSBundleUtilities.m
//  My-Villages
//
//  Created by Jeffrey Camealy on 12/12/12.
//  Copyright (c) 2012 bearMontain. All rights reserved.
//

#import "BMNSBundleUtilities.h"

NSArray *arrayFromPlistNamed(NSString *name) {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"plist"];
    return [NSArray arrayWithContentsOfFile:path];
}

UIView *rootViewFromNibNamed(NSString *name) {
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil];
    assert(views.count==1);
    return views.lastObject;
}
