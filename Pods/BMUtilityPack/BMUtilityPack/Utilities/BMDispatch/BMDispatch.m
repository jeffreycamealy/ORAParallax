//
//  BMDispatch.m
//
//  Created by Jeffrey Camealy on 4/20/12.
//  Copyright (c) 2012 bearMountain. All rights reserved.
//

#import "BMDispatch.h"

void bm_dispatch_after(double seconds, dispatch_block_t block)
{
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, seconds * NSEC_PER_SEC);
    dispatch_after(delayTime, dispatch_get_main_queue(), block);
}

void bm_dispatch_to_main_queue(dispatch_block_t block)
{
    dispatch_async(dispatch_get_main_queue(), block);
}

void bm_dispatch_to_background_queue(dispatch_block_t block)
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), block);
}