//
//  RadiusImageCell.m
//  CornerRadiusImage
//
//  Created by Silent on 2017/4/25.
//  Copyright © 2017年 Silence. All rights reserved.
//

#import "RadiusImageCell.h"
#import "UIImageView+CornerRadius.h"

@interface RadiusImageCell ()

@end
@implementation RadiusImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self image:self.leftImage radius:20.0];
    [self image:self.centerImage radius:12.0];
    [self image:self.rightImage radius:10.0];
}

- (void)setDict:(NSDictionary *)dict {
    _dict = dict;
    self.leftImage.image = [UIImage imageNamed:dict[@"leftm"]];
    self.centerImage.image = [UIImage imageNamed:dict[@"centerm"]];
    self.rightImage.image = [UIImage imageNamed:dict[@"rightm"]];
    
    self.leftLabel.text = dict[@"leftTitle"];
    self.rightLabel.text = dict[@"rightTitle"];
}

- (void)image:(UIImageView *)view radius:(CGFloat)radius {
//    view.layer.cornerRadius = radius;
//    view.layer.masksToBounds = YES;
//    

    // 用了这方法之后 内存下降了不少 但是，FPS 并不会下降 应该是没有使用多线程的原因
    [view zy_cornerRadiusAdvance:radius rectCornerType:UIRectCornerAllCorners];
    
}

@end
