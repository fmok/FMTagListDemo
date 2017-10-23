//
//  Control.m
//  FMTagListDemo
//
//  Created by fm on 2017/10/23.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import "Control.h"
#import "TagCell.h"
#import "SectionHeader.h"

NSString *const kTagCellIdentifier = @"TagCell";
NSString *const kCellIdentifier = @"UITableViewCell";
NSString *const kSectionHeaderIdentifier = @"SectionHeader";

@interface Control()
{
    NSArray *contentArr;
}

@end

@implementation Control

#pragma mark - Public methods
- (void)configData
{
    contentArr = @[@"哈哈", @"呵呵", @"吖了个峥", @"嘿嘿嘿嘿嘿嘿嘿嘿", @"90后毕业写小说", @"中国楼市降温", @"456", @"打擦边球 披内容外衣 花式小剧场广告还能火多久?", @"韩媒：中国在非洲压倒性的投资规模令日本紧张", @"123", @"资本的本性是逐利的，哪一个行业利润高，资本就会闻风而动，快速转向这一行业", @"噗"];
    [self.vc.tagListView addTags:contentArr];
    [self.vc.tableView reloadData];
}

- (void)registerCell
{
    [self.vc.tableView registerClass:[TagCell class] forCellReuseIdentifier:kTagCellIdentifier];
    [self.vc.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    [self.vc.tableView registerClass:[SectionHeader class] forHeaderFooterViewReuseIdentifier:kSectionHeaderIdentifier];
}

- (void)clickTag:(NSString *)tagStr index:(NSInteger)index
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.title = [NSString stringWithFormat:@"%@:%@", @(index), tagStr];//contentArr[index];
    [self.vc.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        CGFloat H = self.vc.tagListView.tagListH;
        return H;
    }
    return 50.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    SectionHeader *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kSectionHeaderIdentifier];
    if (!headerView) {
        headerView = [[SectionHeader alloc] initWithReuseIdentifier:kSectionHeaderIdentifier];
    }
    if (section == 0) {
        [headerView updateHeaderContent:@"热门搜索"];
    } else if (section == 1) {
        [headerView updateHeaderContent:@"历史记录"];
    }
    return headerView;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.title = [NSString stringWithFormat:@"****** %@ ******", @(indexPath.row)];
    [self.vc.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 20;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        TagCell *cell = [tableView dequeueReusableCellWithIdentifier:kTagCellIdentifier forIndexPath:indexPath];
        cell.tagListView = self.vc.tagListView;
        return cell;
    } else if (indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
        cell.textLabel.text = [NSString stringWithFormat:@"****** %@ ******", @(indexPath.row)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


@end
