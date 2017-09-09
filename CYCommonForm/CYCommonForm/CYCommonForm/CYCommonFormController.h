//
//  CYCommonFormController.h
//  CYCommonForm
//
//  Created by cy on 09/09/2017.
//  Copyright © 2017 com.jiemu.commonForm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYCommonFormView.h"
@class CYCommonFormDataSource;

typedef enum : NSUInteger {
    CYDataTypeExist,
    CYDataTypeNone,
}CYDataType;


@interface CYCommonFormController : UIViewController
@property(nonatomic, strong) CYCommonFormDataSource *dataSource;
@property(nonatomic, strong) CYCommonFormView *tableView;
- (instancetype)initWithDataType:(CYDataType)dataType;
- (void)configTableView;
@end
