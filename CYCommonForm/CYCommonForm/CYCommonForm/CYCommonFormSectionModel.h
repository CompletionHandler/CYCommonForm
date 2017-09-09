//
//  CYCommonFormSectionModel.h
//  CYCommonForm
//
//  Created by cy on 09/09/2017.
//  Copyright © 2017 com.jiemu.commonForm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CYCommonFormModel;
@interface CYCommonFormSectionModel : NSObject

@property (nonatomic, copy)   NSString *sectionHeaderTitle;         //该section的标题
@property (nonatomic, copy)   NSString *sectionFooterTitle;         //该section的标题
@property (nonatomic, strong) NSMutableArray  *cellViewModelsArray;        //该section的数据源
@property (nonatomic, assign) CGFloat  sectionHeaderHeight;         //header的高度
@property (nonatomic, assign) CGFloat  sectionFooterHeight;         //footer的高度
- (instancetype)initWithCellViewModels:(NSArray<CYCommonFormModel *> *)cellViewModelsArray;
@end
