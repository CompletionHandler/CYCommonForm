//
//  CYCommonFormSectionModel.m
//  CYCommonForm
//
//  Created by cy on 09/09/2017.
//  Copyright © 2017 com.jiemu.commonForm. All rights reserved.
//

#import "CYCommonFormSectionModel.h"

@implementation CYCommonFormSectionModel

- (instancetype)initWithCellViewModels:(NSArray<CYCommonFormModel *> *)cellViewModelsArray
{
    self = [super init];
    if (self) {
        _sectionHeaderHeight = 0.001;
        _sectionFooterHeight = 0.001;
        _cellViewModelsArray = [cellViewModelsArray mutableCopy];
    }
    return self;
}


@end
