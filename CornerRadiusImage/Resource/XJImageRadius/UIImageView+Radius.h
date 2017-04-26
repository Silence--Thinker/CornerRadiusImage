//
//  UIImageView+Radius.h
//  CornerRadiusImage
//
//  Created by Silent on 2017/4/25.
//  Copyright © 2017年 Silence. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CornerRadius.h"

@interface UIImageView (Radius)

@property (nonatomic, strong, readonly) CornerRadius *cornerConfig;

@end
