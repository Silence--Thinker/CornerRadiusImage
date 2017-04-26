//
//  ViewController.m
//  CornerRadiusImage
//
//  Created by Silent on 2017/4/25.
//  Copyright © 2017年 Silence. All rights reserved.
//

#import "ViewController.h"
#import "RadiusImageCell.h"
#import "YYFPSLabel.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataList;

@end
@implementation ViewController

- (void)dealloc {
    _tableView.dataSource = nil;
    _tableView.delegate = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YYFPSLabel *label = [[YYFPSLabel alloc] init];
    label.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 100, [UIScreen mainScreen].bounds.size.height - 80, 60, 30);
    [label sizeToFit];
    [self.view addSubview:label];
}

// MARK - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RadiusImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RadiusImageCell"];
    cell.dict = self.dataList[indexPath.row];
    return cell;
}

- (NSMutableArray *)dataList {
    if (!_dataList) {
        _dataList = [NSMutableArray array];
        NSArray *title = @[@"新浪娱乐讯 4月25日中午",
                           @"演员张译",
                           @"译解释道，他成样的事情在",
                           @"节目上讲，自认为摘取了欢乐的一段”",
                           @"造成了大众的误解，对此深表",
                           @"歉意。他也为自己往年跟女性开玩笑的行为"];
        NSArray *image = @[@"image_01",
                           @"image_02",
                           @"image_03",
                           @"image_04",
                           @"image_05"];
        for (NSInteger i = 0; i < 50; i++) {
            NSDictionary *dict = @{@"leftTitle":title[1], //title[arc4random() % 6],
                                   @"rightTitle":title[1], //title[arc4random() % 6],
                                   @"leftm":image[arc4random() % 5],
                                   @"rightm":image[arc4random() % 5],
                                   @"centerm":image[arc4random() % 5]};
            [_dataList addObject:dict];
        }
    }
    return _dataList;
}

@end
