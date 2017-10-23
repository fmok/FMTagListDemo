//
//  TagCell.m
//  FMTagListDemo
//
//  Created by fm on 2017/10/23.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import "TagCell.h"

@interface TagCell()

@end

@implementation TagCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

#pragma mark - Public methods


#pragma mark - setter
- (void)setTagListView:(FMTagListView *)tagListView
{
    _tagListView = tagListView;
    
    [self.contentView addSubview:_tagListView];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
