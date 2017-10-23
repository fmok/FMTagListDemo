//
//  FMTagButton.m
//  FMTagListDemo
//
//  Created by fm on 2017/10/23.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import "FMTagButton.h"

extern CGFloat const imageViewWH;

@implementation FMTagButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.imageView.frame.size.width <= 0) return;
    
    CGFloat btnW = self.bounds.size.width;
    CGFloat btnH = self.bounds.size.height;
    
    self.titleLabel.frame = CGRectMake(_margin, self.titleLabel.frame.origin.y, self.titleLabel.frame.size.width, self.titleLabel.frame.size.height);
    
    CGFloat imageX = btnW - self.imageView.frame.size.width -  _margin;
    self.imageView.frame = CGRectMake(imageX, (btnH - imageViewWH) * 0.5, imageViewWH, imageViewWH);
//    NSLog(@"%@",NSStringFromCGRect(self.frame));
//    NSLog(@"%@",NSStringFromCGRect(self.imageView.frame));
}

- (void)setHighlighted:(BOOL)highlighted {}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
