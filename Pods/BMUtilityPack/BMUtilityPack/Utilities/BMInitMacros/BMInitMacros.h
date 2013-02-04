//
//  BMInitMacros.h
//  My-Villages
//
//  Created by Jeffrey Camealy on 12/26/12.
//  Copyright (c) 2012 bearMountain. All rights reserved.
//


#define UIViewControllerCommonInit(code)        \
- (id)init {                                    \
    if (self = [super init]) {                  \
        code;                                   \
    }                                           \
    return self;                                \
}                                               \
                                                \
- (id)initWithCoder:(NSCoder *)coder {          \
    if (self = [super initWithCoder:coder]) {   \
        code;                                   \
    }                                           \
    return self;                                \
}


#define UIViewCommonInit(code)                  \
- (id)initWithFrame:(CGRect)frame {             \
    if (self = [super initWithFrame:frame]) {   \
        code;                                   \
    }                                           \
    return self;                                \
}                                               \
                                                \
- (id)initWithCoder:(NSCoder *)coder {          \
    if (self = [super initWithCoder:coder]) {   \
        code;                                   \
    }                                           \
    return self;                                \
}


#define NSInit(code)                            \
- (id)init {                                    \
    if (self = [super init]) {                  \
        code;                                   \
    }                                           \
    return self;                                \
}



















