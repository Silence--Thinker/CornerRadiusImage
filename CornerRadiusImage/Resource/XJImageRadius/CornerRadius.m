//
//  CornerRadius.m
//  CornerRadiusImage
//
//  Created by Silent on 2017/4/26.
//  Copyright © 2017年 Silence. All rights reserved.
//

#import "CornerRadius.h"

@implementation CornerRadius

- (instancetype)init {
    if (self = [super init]) {
        _rectCrnerType = UIRectCornerAllCorners;
        _borderColor = [UIColor whiteColor];
        _clipRadius = NO;
        _borderWidth = 0.0;
        _radius = 0.0;
    }
    return self;
}


@end
