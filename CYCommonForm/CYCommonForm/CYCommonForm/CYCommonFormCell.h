//
//  CYCommonFormCell.h
//  CYCommonForm
//
//  Created by cy on 09/09/2017.
//  Copyright © 2017 com.jiemu.commonForm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYCommonFormModel.h"

@interface CYCommonFormCell : UITableViewCell
@property (nonatomic, strong) CYCommonFormModel *formModel;
- (void)layoutLeftTextAccessoryTextWithCellModel:(CYCommonFormModel *)formModel;
@end

@interface CYCommonFormCell (LeftTextAccessoryIdtTextImg)
- (void)layoutLeftTextAccessoryIdtTextImgWithCellModel:(CYCommonFormModel *)formModel;
@end
