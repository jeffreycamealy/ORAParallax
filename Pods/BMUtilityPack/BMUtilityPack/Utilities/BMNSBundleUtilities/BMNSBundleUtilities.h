//
//  BMNSBundleUtilities.h
//  My-Villages
//
//  Created by Jeffrey Camealy on 12/12/12.
//  Copyright (c) 2012 bearMontain. All rights reserved.
//

#import <Foundation/Foundation.h>

NSArray *arrayFromPlistNamed(NSString *name);

//
// Function assumes there exists only 1 top level view object.
//
UIView *rootViewFromNibNamed(NSString *name);