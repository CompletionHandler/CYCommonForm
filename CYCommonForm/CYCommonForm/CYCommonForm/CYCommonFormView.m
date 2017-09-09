//
//  CYCommonFormView.m
//  CYCommonForm
//
//  Created by cy on 09/09/2017.
//  Copyright © 2017 com.jiemu.commonForm. All rights reserved.
//

#import "CYCommonFormView.h"
#import "CYCommonFormModel.h"
#import "CYCommonFormSectionModel.h"
#import "CYCommonFormConst.h"
@interface CYCommonFormView()<UITableViewDelegate>{
    UITapGestureRecognizer *_gestureRecognizer;
}

@end

@implementation CYCommonFormView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        self.delegate = self;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
        _gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
        self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CYScreenWidth, CYTableViewTopMargin)];
    }
    return self;
}

- (void)setDataSourceDelegate:(id<NEMCommonDataSourceDelegate>)dataSourceDelegate{
    if (_dataSourceDelegate != dataSourceDelegate) {
        _dataSourceDelegate = dataSourceDelegate;
        self.dataSource = dataSourceDelegate;
    }
}

#pragma mark - Tableview Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CYCommonFormModel *cellModel = [self.dataSourceDelegate tableView:tableView cellViewModelAtIndexPath:indexPath];
    return cellModel.cellHeight;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CYCommonFormSectionModel *sectionModel = [self.dataSourceDelegate tableView:tableView sectionViewModelInSection:section];
    return sectionModel.sectionHeaderHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    CYCommonFormSectionModel *sectionModel = [self.dataSourceDelegate tableView:tableView sectionViewModelInSection:section];
    return sectionModel.sectionFooterHeight;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CYCommonFormModel *cellViewModel = [self.dataSourceDelegate tableView:tableView cellViewModelAtIndexPath:indexPath];
    if (cellViewModel.cellDidSelectedCallBack != nil) {
        cellViewModel.cellDidSelectedCallBack();
    }
}

#pragma mark Action
- (void)singleTap:(UITapGestureRecognizer *)recognizer {
    [self endEditing:true];
}

- (void)keyboardWillShow:(NSNotification*)note{
    [self addGestureRecognizer:_gestureRecognizer];
}

- (void)keyboardWillHide:(NSNotification*)note{
    [self removeGestureRecognizer:_gestureRecognizer];
}

@end
