//
//  TwoItemsCell.h
//  Parallax
//
//  Created by Jeffrey Camealy on 2/4/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParallaxItemsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *centeringView;
@property (weak, nonatomic) IBOutlet UIImageView *item1;
@property (weak, nonatomic) IBOutlet UIImageView *item2;
@property (weak, nonatomic) IBOutlet UIView *itemMiddle;
- (id)initWithNibName:(NSString*)name;
- (void)offsetItemsForVerticalOffset:(float)verticalOffset;
@end
