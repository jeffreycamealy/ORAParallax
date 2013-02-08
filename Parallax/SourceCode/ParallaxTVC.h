//
//  ParallaxTVC.h
//  Parallax
//
//  Created by Jeffrey Camealy on 1/23/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParallaxTVC : UIViewController <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *userTouchScrollView;
@property (weak, nonatomic) IBOutlet UIView *layer2;
@property (weak, nonatomic) IBOutlet UITableView *layer2TableView;
@property (weak, nonatomic) IBOutlet UITableView *layer3TableView;
@end
