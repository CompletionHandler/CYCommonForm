//
//  CYCommonFormDataSource.h
//  CYCommonForm
//
//  Created by cy on 09/09/2017.
//  Copyright © 2017 com.jiemu.commonForm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CYCommonFormModel;
@class CYCommonFormSectionModel;
@class CYCommonFormCell;
@protocol NEMCommonDataSourceDelegate <UITableViewDataSource>
@optional
- (CYCommonFormSectionModel *)tableView:(UITableView *)tableView sectionViewModelInSection:(NSInteger )section;
- (CYCommonFormModel *)tableView:(UITableView *)tableview cellViewModelAtIndexPath:(NSIndexPath *)indexPath;
- (void)setFormModel:(CYCommonFormModel *)formModel cellModelAtIndexPath:(NSIndexPath *)indexPath;
@end

typedef void(^CYCommonCellConfigureBlock)(CYCommonFormCell *cell, CYCommonFormModel *viewModel);

@interface CYCommonFormDataSource : NSObject<NEMCommonDataSourceDelegate>
@property (nonatomic, strong) NSArray *sectionModels;
- (instancetype)initWithViewModelsArray:(NSArray *)viewModelsArray configureBlock:(CYCommonCellConfigureBlock)block;
@end
