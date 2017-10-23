//
//  ViewController.m
//  FMTagListDemo
//
//  Created by fm on 2017/10/23.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import "ViewController.h"
#import "Control.h"

@interface ViewController ()

@property (nonatomic, strong) Control *control;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    WS(weakSelf);
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    [self.control registerCell];
    [self.control configData];
}


#pragma mark - getter
- (Control *)control
{
    if (!_control) {
        _control = [[Control alloc] init];
        _control.vc = self;
    }
    return _control;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self.control;
        _tableView.dataSource = self.control;
        _tableView.showsVerticalScrollIndicator = NO;
    }
    return _tableView;
}

- (FMTagListView *)tagListView
{
    if (!_tagListView) {
        _tagListView = [[FMTagListView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
        _tagListView.backgroundColor = [UIColor grayColor];
        _tagListView.tagBackgroundColor = [UIColor colorWithRed:20 / 255.0 green:145 / 255.0 blue:255 / 255.0 alpha:1];
        _tagListView.tagCornerRadius = 7;
        WS(weakSelf);
        _tagListView.clickTagBlock = ^(NSString *tag, NSInteger index){
            [weakSelf.control clickTag:tag index:index];
        };
        _tagListView.tagColor = [UIColor whiteColor];
    }
    return _tagListView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
