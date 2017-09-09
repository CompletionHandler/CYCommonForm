//
//  CYCommonFormView.h
//  CYCommonForm
//
//  Created by cy on 09/09/2017.
//  Copyright © 2017 com.jiemu.commonForm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYCommonFormDataSource.h"

@interface CYCommonFormView : UITableView
@property (nonatomic, weak) id <NEMCommonDataSourceDelegate> dataSourceDelegate;
@end
