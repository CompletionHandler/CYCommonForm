//
//  CYCommonFormModel.m
//  CYCommonForm
//
//  Created by cy on 09/09/2017.
//  Copyright © 2017 com.jiemu.commonForm. All rights reserved.
//

#import "CYCommonFormModel.h"
#import "CYCommonFormConst.h"

@interface CYCommonFormModel()
@end

@implementation CYCommonFormModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cellHeight = 44;
        _cellID = @"defaultCell";
        
        _leftLabelTextFont = CYLeftTitleTextFont;
        _leftLabelTextColor = [UIColor colorWithRed:96 /255.0 green:100 / 255.0 blue:112 / 255.0 alpha:1.0];
        _leftImageAndLabelGap = CYLeftMiddleMargin;
        _indicatorLeftLabelTextFont = CYIndicatorLeftTitleFont;
        _indicatorLeftLabelTextColor = [UIColor colorWithRed:0 / 255.0 green:0 / 255.0 blue:0 / 255.0 alpha:0.9];
        _indicatorLeftImageAndLabelGap = CYRightMargin;
        _indicatorLeftTextFont = CYIndicatorLeftTitleTextFont;
        _indicatorLeftTextColor = [UIColor colorWithRed:0 / 255.0 green:0 / 255.0 blue:0 / 255.0 alpha:0.9];
        _isSecureTextEntry = NO;
    }
    return self;
}

- (instancetype)initWithLeftTitle:(NSString *)title idtLeftText:(NSString *)idtLeftText placeholder:(NSString *) placeHolder keyBoardType:(UIKeyboardType) keyType isSecureTextEntry:(BOOL) isSecureTextEntry{
    if ([self init]) {
        _leftTitle = title;
        _indicatorLeftText = idtLeftText;
        _indicatorLeftTextplaceholder = placeHolder;
        _indicatorLeftTextKeyBoardType = keyType;
        _isShowText = YES;
        _isSecureTextEntry = isSecureTextEntry;
    }
    return self;
}
- (instancetype)initWithLeftTitle:(NSString *)title idtLeftTitle:(NSString *)idtLeftTitle{
    if ([self init]) {
        _leftTitle = title;
        _indicatorLeftTitle = idtLeftTitle;
        _isShowText = NO;
    }
    return self;
}

- (instancetype)initAccessoryIdtTextImgWithWithLeftTitle:(NSString *)title idtLeftTitle:(NSString *)idtLeftTitle{
    if ([self initWithLeftTitle:title idtLeftTitle:idtLeftTitle]) {
        _cellType = CYCommonCellLeftTextAccessoryIdtTextImg;
    }
    return self;
}

- (instancetype)initAccessoryIdtTextImgWithWithLeftTitle:(NSString *)title idtLeftTitle:(NSString *)idtLeftTitle leftTitleColor:(UIColor *)color{
    if ([self initWithLeftTitle:title idtLeftTitle:idtLeftTitle]) {
        _cellType = CYCommonCellLeftTextAccessoryIdtTextImg;
        _indicatorLeftLabelTextColor = color;
    }
    return self;
    return self;
}
@end
