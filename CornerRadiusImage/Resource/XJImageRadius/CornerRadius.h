//
//  CornerRadius.h
//  CornerRadiusImage
//
//  Created by Silent on 2017/4/26.
//  Copyright © 2017年 Silence. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CornerRadius : NSObject

//  view.layer.borderColor
//  view.layer.borderWidth

@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) UIRectCorner rectCrnerType;

@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, strong) UIColor *borderColor;

@property (nonatomic, assign) BOOL clipRadius;
@property (nonatomic, strong) UIImage *radiusImage;
@end
