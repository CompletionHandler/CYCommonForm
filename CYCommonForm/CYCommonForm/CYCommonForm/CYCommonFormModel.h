//
//  CYCommonFormModel.h
//  CYCommonForm
//
//  Created by cy on 09/09/2017.
//  Copyright © 2017 com.jiemu.commonForm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CYCommonFormCellType) {
    CYCommonCellLeftTextAccessoryText,                   //左侧是文字，右侧是文本或者textFiled或者什么都没有
    CYCommonCellLeftTextAccessoryIdtTextImg,    //左侧是文字，右侧依次是箭头，文本（文本框）或 图片（其中文本和图片可没有）
    CYCommonCellAccessorySwitch,                 //右侧是开关
    CYCommonCellAccessoryText,                   //右侧为文本框或者文本
    CYCommonCellAccessoryBtn,                    //右侧为按钮（按钮左侧可以有一个label或者textView）
};

typedef void(^CYSwitchValueChangeCompletion) (BOOL isOn);
typedef void(^CYRightBtnCompletion) ();
typedef void(^CYCellDidSelectedCompletion) ();

@interface CYCommonFormModel : NSObject

@property (nonatomic, assign) CYCommonFormCellType cellType;                    //类型
@property (nonatomic, copy)   NSString *cellID;                                  //cell reuser identifier
#pragma mark 系统默认cell左侧
@property (nonatomic, strong) UIImage  *leftImage;                               //左侧的image，按需传入
@property (nonatomic, assign) CGSize leftImageSize;                              //左侧image的大小，存在默认设置
@property (nonatomic, copy)   NSString *leftTitle;                               //cell主标题，按需传入
@property (nonatomic, strong) UIColor *leftLabelTextColor;                       //当前组cell左侧label里文字的颜色
@property (nonatomic, strong) UIFont *leftLabelTextFont;                         //当前组cell左侧label里文字的字体
@property (nonatomic, assign) CGFloat leftImageAndLabelGap;                      //左侧image和label的距离，存在默认值
#pragma mark 系统默认cell右侧
@property (nonatomic, copy)   NSString *indicatorLeftTitle;                      //右侧箭头左侧的文本，按需传入
@property (nonatomic, strong) UIColor *indicatorLeftLabelTextColor;              //右侧文字的颜色，存在默认设置，也可以自定义
@property (nonatomic, strong) UIFont *indicatorLeftLabelTextFont;                //右侧文字的字体，存在默认设置，也可以自定义
@property (nonatomic, copy)   NSString *indicatorLeftText;                      //右侧箭头左侧的文本框，按需传入
@property (nonatomic, strong) UIColor *indicatorLeftTextColor;              //右侧文本框的颜色，存在默认设置，也可以自定义
@property (nonatomic, strong) UIFont *indicatorLeftTextFont;                //右侧文本框的字体，存在默认设置，也可以自定义
@property (nonatomic, copy) NSString *indicatorLeftTextplaceholder;
@property (nonatomic, strong) UIColor *indicatorLeftTextplaceholderColor;              //右侧文本框提示文字的颜色，存在默认设置，也可以自定义
@property (nonatomic, strong) UIFont *indicatorLeftTextplaceholderFont;                //右侧文本框提示文字的字体，存在默认设置，也可以自定义
@property (nonatomic, assign) UIKeyboardType indicatorLeftTextKeyBoardType;            //键盘类型
@property (nonatomic, strong) UIImage *indicatorLeftImage;                       //右侧箭头左侧的image，按需传入
@property (nonatomic, assign) CGSize indicatorLeftImageSize;                     //右侧尖头左侧image大小，存在默认设置，也可以自定义

@property (nonatomic, assign, readonly)  BOOL hasIndicatorImageAndLabel;         //右侧尖头左侧的文本和image是否同时存在，只能通过内部计算

@property (nonatomic, assign) CGFloat indicatorLeftImageAndLabelGap;             //右侧尖头左侧image和label的距离，存在默认值
@property (nonatomic, assign) BOOL isImageFirst;                                 //右侧尖头左侧的文本和image同时存在时，是否是image挨着箭头，默认为YES
@property (nonatomic, copy) CYSwitchValueChangeCompletion switchValueChangedCallBack;    //切换switch开关的时候调用的block
@property (nonatomic, copy) CYRightBtnCompletion btnClickCallBack;    //点击btn回调
@property (nonatomic, copy) CYCellDidSelectedCompletion cellDidSelectedCallBack;    //点击btn回调
#pragma mark 宽高数据
@property (nonatomic, assign) CGFloat cellHeight;                                //cell高度,默认是44，可以设置
@property (nonatomic, assign) CGSize  leftTitleLabelSize;                        //左侧默认Label的size，传入text以后内部计算
@property (nonatomic, assign) CGSize  indicatorLeftLabelSize;                    //右侧label的size

#pragma mark 兼容扩展属性
@property (nonatomic, strong) Class cellClass;                                    //自定义cell
@property (nonatomic, assign) BOOL isHidden;                                     //动态调整cell的位置
@property (nonatomic, assign) NSInteger maxCountOfTextField;                     //右侧textFiled最大字数限制
@property (nonatomic, assign) NSInteger numLineOfIdtLeftLabel;                  //右侧label最大行数
@property (nonatomic, assign) BOOL isSecureTextEntry;                  //文本框是否为密码模式
@property (nonatomic, assign) BOOL isShowText;                                     //当文本和文本框同时存在的时候，控制是否展示文本框

- (instancetype)initWithLeftTitle:(NSString *)title idtLeftText:(NSString *)idtLeftText placeholder:(NSString *) placeHolder keyBoardType:(UIKeyboardType) keyType isSecureTextEntry:(BOOL) isSecureTextEntry;
- (instancetype)initWithLeftTitle:(NSString *)title idtLeftTitle:(NSString *)idtLeftTitle;
- (instancetype)initAccessoryIdtTextImgWithWithLeftTitle:(NSString *)title idtLeftTitle:(NSString *)idtLeftTitle;
- (instancetype)initAccessoryIdtTextImgWithWithLeftTitle:(NSString *)title idtLeftTitle:(NSString *)idtLeftTitle leftTitleColor:(UIColor *)color;
@end
