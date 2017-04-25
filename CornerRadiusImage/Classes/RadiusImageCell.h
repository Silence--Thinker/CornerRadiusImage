//
//  RadiusImageCell.h
//  CornerRadiusImage
//
//  Created by Silent on 2017/4/25.
//  Copyright © 2017年 Silence. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RadiusImageCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *leftImage;
@property (nonatomic, weak) IBOutlet UIImageView *centerImage;
@property (nonatomic, weak) IBOutlet UIImageView *rightImage;

@property (nonatomic, weak) IBOutlet UILabel *leftLabel;
@property (nonatomic, weak) IBOutlet UILabel *rightLabel;


@property (nonatomic, strong) NSDictionary *dict;
@end
