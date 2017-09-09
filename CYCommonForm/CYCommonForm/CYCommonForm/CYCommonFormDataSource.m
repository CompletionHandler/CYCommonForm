//
//  CYCommonFormDataSource.m
//  CYCommonForm
//
//  Created by cy on 09/09/2017.
//  Copyright © 2017 com.jiemu.commonForm. All rights reserved.
//

#import "CYCommonFormDataSource.h"
#import "CYCommonFormModel.h"
#import "CYCommonFormCell.h"
#import "CYCommonFormSectionModel.h"

@interface CYCommonFormDataSource()
@property (nonatomic, copy) CYCommonCellConfigureBlock cellConfigureBlock;
@end

@implementation CYCommonFormDataSource

#pragma mark- Public API

- (instancetype)initWithViewModelsArray:(NSArray *)viewModelsArray configureBlock:(CYCommonCellConfigureBlock)block
{
    self = [super init];
    if (self) {
        self.sectionModels = viewModelsArray;
        self.cellConfigureBlock = [block copy];
    }
    return self;
}

#pragma mark- TableViewDataSource
- (CYCommonFormModel *)tableView:(UITableView *)tableview cellViewModelAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.sectionModels.count > indexPath.section) {
        CYCommonFormSectionModel *sectionViewModel = [self.sectionModels objectAtIndex:indexPath.section];
        if (sectionViewModel.cellViewModelsArray.count > indexPath.row) {
            return [sectionViewModel.cellViewModelsArray objectAtIndex:indexPath.row];
        }
    }
    return nil;
}

- (CYCommonFormSectionModel *)tableView:(UITableView *)tableView sectionViewModelInSection:(NSInteger )section
{
    if (self.sectionModels.count > section) {
        return [self.sectionModels objectAtIndex:section];
    }
    return nil;
}

- (void)setFormModel:(CYCommonFormModel *)formModel cellModelAtIndexPath:(NSIndexPath *)indexPath{
    if (self.sectionModels.count > indexPath.section) {
        CYCommonFormSectionModel *sectionViewModel = [self.sectionModels objectAtIndex:indexPath.section];
        if (sectionViewModel.cellViewModelsArray.count > indexPath.row) {
            sectionViewModel.cellViewModelsArray[indexPath.row] = formModel;
        }
    }
    
}

#pragma mark - Tableview Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionModels.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CYCommonFormSectionModel *vm = self.sectionModels[section];
    return vm.cellViewModelsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CYCommonFormSectionModel *sectionViewModel = self.sectionModels[indexPath.section];
    CYCommonFormModel *cellViewModel = sectionViewModel.cellViewModelsArray[indexPath.row];
    
    CYCommonFormCell *cell = [tableView dequeueReusableCellWithIdentifier:cellViewModel.cellID];
    if (!cell) {
        cell = [[CYCommonFormCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellViewModel.cellID];
    }
    self.cellConfigureBlock(cell,cellViewModel);
    
    return cell;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    CYCommonFormSectionModel *vm = self.sectionModels[section];
    return vm.sectionHeaderTitle;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    CYCommonFormSectionModel *vm = self.sectionModels[section];
    return vm.sectionFooterTitle;
}

@end
