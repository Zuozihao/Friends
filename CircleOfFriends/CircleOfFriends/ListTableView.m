//
//  ListTableView.m
//  CircleOfFriends
//
//  Created by 左梓豪 on 16/8/17.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import "ListTableView.h"
#import "CircleOfFreindsCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "CommentView.h"
#import "CircleOfFriendsData.h"

@interface ListTableView ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, assign)CGFloat cellHeight;

@end

@implementation ListTableView

@synthesize dataArray = _dataArray;

- (instancetype)initWithFrame:(CGRect)frame
                        style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        _cellHeight = 400;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableViewData:) name:@"NewLikeAction" object:nil];
        [self registerClass:[CircleOfFreindsCell class] forCellReuseIdentifier:@"cell"];
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

- (void)reloadTableViewData:(NSNotification *)notification {
    NSDictionary *dic = notification.object;
    NSInteger row = [dic[@"row"] integerValue];
    CircleOfFriendsData *data = dic[@"data"];
    NSMutableArray *newArray = [[NSMutableArray alloc] initWithArray:_dataArray];
    [newArray replaceObjectAtIndex:row withObject:data];
    _dataArray = [newArray copy];
    [self reloadData];
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.dataArray != nil) {
        return self.dataArray.count;
    }
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CircleOfFreindsCell *cell = [[CircleOfFreindsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (_dataArray.count > 0) {
//        cell.data = _dataArray[indexPath.row];
        [cell setData:_dataArray[indexPath.row] indexPath:indexPath];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CircleOfFriendsData *data = _dataArray[indexPath.row];
    return data.height;
}

@end
