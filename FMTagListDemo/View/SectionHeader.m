//
//  SectionHeader.m
//  FMTagListDemo
//
//  Created by fm on 2017/10/23.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import "SectionHeader.h"

@implementation SectionHeader

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)updateHeaderContent:(NSString *)text
{
    self.textLabel.text = text;
    self.textLabel.textColor = [UIColor blackColor];
}


@end
