//
//  UITableView+Utilities.m
//  My-Villages
//
//  Created by Jeffrey Camealy on 1/4/13.
//  Copyright (c) 2013 bearMontain. All rights reserved.
//

#import "UITableView+Utilities.h"

@implementation UITableView (Utilities)

- (void)registerNibNamed:(NSString *)nibName forCellReuseIdentifier:(NSString *)identifier {
    UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:identifier];
}

@end
