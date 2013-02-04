//
//  BMDispatch.h
//
//  Created by Jeffrey Camealy on 4/20/12.
//  Copyright (c) 2012 bearMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^bm_block)(void);

void bm_dispatch_after(double seconds, dispatch_block_t block);
void bm_dispatch_to_main_queue(dispatch_block_t block);
void bm_dispatch_to_background_queue(dispatch_block_t block);