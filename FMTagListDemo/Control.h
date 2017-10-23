//
//  Control.h
//  FMTagListDemo
//
//  Created by fm on 2017/10/23.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface Control : NSObject<
    UITableViewDelegate,
    UITableViewDataSource>

@property (nonatomic, weak) ViewController *vc;

- (void)configData;
- (void)registerCell;
- (void)clickTag:(NSString *)tagStr index:(NSInteger)index;

@end
