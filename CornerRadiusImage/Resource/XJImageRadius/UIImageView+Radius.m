//
//  UIImageView+Radius.m
//  CornerRadiusImage
//
//  Created by Silent on 2017/4/25.
//  Copyright © 2017年 Silence. All rights reserved.
//

#import "UIImageView+Radius.h"
#import <objc/runtime.h>

@interface UIImageView ()


@end
@implementation UIImageView (Radius)

+ (void)load {
    SEL selectors[] = {
        @selector(setImage:),
        @selector(setHighlightedImage:),
    };
    
    for (NSUInteger index = 0; index < sizeof(selectors) / sizeof(SEL); index ++) {
        SEL originalSelector = selectors[index];
        SEL swizzledSelector = NSSelectorFromString([@"xj_" stringByAppendingString:NSStringFromSelector(originalSelector)]);
        
        Method originalMethod = class_getInstanceMethod(self, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
        
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (void)xj_setImage:(UIImage *)image {
    [self displayOriginalImage:image completon:^(UIImage *cornerImage) {
        [self xj_setImage:cornerImage];
    }];
}

- (void)xj_setHighlightedImage:(UIImage *)highlightedImage {
    
    [self displayOriginalImage:highlightedImage completon:^(UIImage *cornerImage) {
        [self xj_setHighlightedImage:cornerImage];
    }];
}

- (void)displayOriginalImage:(UIImage *)originalImage
                   completon:(void(^)(UIImage *cornerImage))completion {
    if (self.cornerConfig.radius <= 0 || originalImage == nil) {
        completion(originalImage);
        return;
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        CGFloat cornerRadius = self.cornerConfig.radius;
        CGFloat borderWidth = self.cornerConfig.borderWidth;
        UIRectCorner rectCornerType = self.cornerConfig.rectCrnerType;
        UIColor *borderColor = self.cornerConfig.borderColor;
        
        
        CGSize size = self.bounds.size;
        CGFloat scale = [UIScreen mainScreen].scale;
        CGSize cornerRadii = CGSizeMake(cornerRadius, cornerRadius);
        
        UIGraphicsBeginImageContextWithOptions(size, NO, scale);
        CGContextRef currentContext = UIGraphicsGetCurrentContext();
        if (nil == currentContext) {
            completion(originalImage);
            return;
        }
        UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCornerType cornerRadii:cornerRadii];
        [cornerPath addClip];
        [originalImage drawInRect:(CGRect){{0, 0}, size}];
        
        if (borderWidth > 0) {
            [cornerPath setLineWidth:borderWidth * 2];
            [borderColor setStroke];
        }
        [cornerPath stroke];
        
        UIImage *processedImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            !completion ?: completion(processedImage);
        });
    });
}

- (CornerRadius *)cornerConfig {
    CornerRadius *cornerConfig = objc_getAssociatedObject(self, _cmd);
    if (!cornerConfig) {
        cornerConfig = [[CornerRadius alloc] init];
        objc_setAssociatedObject(self, _cmd, cornerConfig, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return cornerConfig;
}

@end
