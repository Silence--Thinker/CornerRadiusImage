//
//  UIImageView+Radius.m
//  CornerRadiusImage
//
//  Created by Silent on 2017/4/25.
//  Copyright © 2017年 Silence. All rights reserved.
//

#import "UIImageView+Radius.h"

@interface UIImageView ()

@property (nonatomic, strong) UIImage *radiusImage;
@property (nonatomic, assign) UIRectCorner rectCrner;

@end
@implementation UIImageView (Radius)

- (void)cornerRadius:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType {
    CGSize size = self.bounds.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize cornerRadii = CGSizeMake(cornerRadius, cornerRadius);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    if (nil == currentContext) {
        return;
    }
    UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCornerType cornerRadii:cornerRadii];
    [cornerPath addClip];
    [self.layer renderInContext:currentContext];
    
    [cornerPath setLineWidth:2];
    [[UIColor redColor] setStroke];
    [cornerPath stroke];
    
    UIImage *processedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.image = processedImage;
}

@end
