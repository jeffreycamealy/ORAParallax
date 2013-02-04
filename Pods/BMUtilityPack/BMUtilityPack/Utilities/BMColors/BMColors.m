//
//  BMColors.m
//  My-Villages
//
//  Created by Jeffrey Camealy on 12/10/12.
//  Copyright (c) 2012 bearMontain. All rights reserved.
//

#import "BMColors.h"

UIColor *grayWithValue(float value) {
    return colorWithRGB(value, value, value);
}

UIColor *colorWithRGB(float red, float green, float blue) {
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
}

UIColor *colorWithRGBA(float red, float green, float blue, float alpha) {
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

UIColor *randomColor() {
    CGFloat red = (arc4random()%256);
    CGFloat green = (arc4random()%256);
    CGFloat blue = (arc4random()%256);
    
    return colorWithRGB(red, green, blue);
}
