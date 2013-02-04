//
//  ParallaxTVC.h
//  Parallax
//
//  Created by Jeffrey Camealy on 1/23/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParallaxTVC : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *layer2;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
