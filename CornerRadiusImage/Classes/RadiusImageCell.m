//
//  RadiusImageCell.m
//  CornerRadiusImage
//
//  Created by Silent on 2017/4/25.
//  Copyright © 2017年 Silence. All rights reserved.
//

#import "RadiusImageCell.h"
#import "UIImageView+CornerRadius.h"
#import "UIImageView+Radius.h"

@interface RadiusImageCell ()

@end
@implementation RadiusImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self xj_bulidingView];
}

- (void)setDict:(NSDictionary *)dict {
    _dict = dict;
    self.leftImage.image = [UIImage imageNamed:dict[@"leftm"]];
    self.centerImage.image = [UIImage imageNamed:dict[@"centerm"]];
    self.rightImage.image = [UIImage imageNamed:dict[@"rightm"]];
    
    self.leftLabel.text = dict[@"leftTitle"];
    self.rightLabel.text = dict[@"rightTitle"];
}

- (void)xj_bulidingView {
    [self image:self.leftImage radius:20.0];
    [self image:self.centerImage radius:12.0];
    [self image:self.rightImage radius:10.0];
    
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image_01"]];
//
//    imageView.layer.cornerRadius = 10.0;
//    imageView.layer.masksToBounds = YES;
//    imageView.frame = CGRectMake(0, 0, 40, 40);
//    [self.contentView addSubview:imageView];
    
//    imageView.cornerConfig.radius = 10;
//    imageView.cornerConfig.borderWidth = 2.0;
//    imageView.cornerConfig.clipRadius = YES;
//    [imageView zy_cornerRadiusAdvance:10.0 rectCornerType:UIRectCornerAllCorners];
}

- (void)image:(UIImageView *)view radius:(CGFloat)radius {
//    view.layer.cornerRadius = radius;
//    view.layer.masksToBounds = YES;
//    view.layer.borderColor = [UIColor blackColor].CGColor;
//    view.layer.borderWidth = 2.0;

    // 用了这方法之后 内存下降了不少 但是，FPS 并不会下降 应该是没有使用多线程的原因
//    [view zy_cornerRadiusAdvance:radius rectCornerType:UIRectCornerAllCorners];
//    [view zy_attachBorderWidth:2 color:[UIColor blackColor]];
    
    view.cornerConfig.radius = radius;
    view.cornerConfig.borderWidth = 2.0;
    view.cornerConfig.borderColor = [UIColor blackColor];
}

@end
