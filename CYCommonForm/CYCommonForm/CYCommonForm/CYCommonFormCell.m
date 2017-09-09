//
//  CYCommonFormCell.m
//  CYCommonForm
//
//  Created by cy on 09/09/2017.
//  Copyright © 2017 com.jiemu.commonForm. All rights reserved.
//

#import "CYCommonFormCell.h"

#import "CYCommonFormCell.h"
#import "CYCommonFormSectionModel.h"
#import "CYCommonFormModel.h"
#import "CYCommonFormConst.h"
#import "Masonry.h"

@interface CYCommonFormCell()

//左半部分
@property (nonatomic, strong) UIImageView *leftImageView;               //左侧的ImageView
@property (nonatomic, strong) UILabel *leftTitleLabel;                  //左侧的Label

//右半部分
@property (nonatomic, strong) UIImageView *indicatorArrow;              //右侧的箭头
@property (nonatomic, strong) UIImageView *indicatorLeftImageView;      //右侧的箭头的左边的imageview
@property (nonatomic, strong) UILabel *indicatorLeftLabel;              //右侧的箭头的左边的Label
@property (nonatomic, strong) UITextField *indicatorLeftTextField;              //右侧的箭头的左边的TextField
@property (nonatomic, strong) UIButton *indicatorBtn;              //右侧的箭头的左边的Label
@property (nonatomic, strong) UISwitch *indicatorSwitch;                //右侧的箭头的左边的

@end

@implementation CYCommonFormCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldEditChanged:) name:UITextFieldTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)textFieldEditChanged:(NSNotification *)notification{
    UITextField *textField = (UITextField*)notification.object;
    if (textField == self.indicatorLeftTextField) {
        self.formModel.indicatorLeftText = textField.text;
    }
}

- (void)layoutLeftTextAccessoryTextWithCellModel:(CYCommonFormModel *)formModel
{
    if (self.contentView.subviews.count == 0) {
        [self setupSubviews];
    }
    self.formModel = formModel;
}

- (void)setupSubviews{
    [self.contentView addSubview:self.leftTitleLabel];
    [self.contentView addSubview:self.indicatorLeftTextField];
    [self.contentView addSubview:self.indicatorLeftLabel];
    
    self.indicatorLeftTextField.textAlignment = NSTextAlignmentRight;
    self.indicatorLeftLabel.textAlignment = NSTextAlignmentRight;
    
    [self.leftTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).offset(CYLeftMargin);
        make.width.equalTo(@10).priorityMedium();
    }];
    
    [self.indicatorLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).offset(-CYRightMargin);
        make.left.lessThanOrEqualTo(self.leftTitleLabel.mas_right).offset(CYLeftMiddleMargin).priorityMedium();
    }];
    
    [self.indicatorLeftTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.indicatorLeftLabel);
    }];
}

- (void)setFormModel:(CYCommonFormModel *)formModel{
    _formModel = formModel;
    
    _leftTitleLabel.font = _formModel.leftLabelTextFont;
    _leftTitleLabel.textColor = _formModel.leftLabelTextColor;
    _leftTitleLabel.text = _formModel.leftTitle;
    _leftImageView.image = _formModel.leftImage;
    
    _indicatorLeftLabel.font = _formModel.indicatorLeftLabelTextFont;
    _indicatorLeftLabel.textColor = _formModel.indicatorLeftLabelTextColor;
    _indicatorLeftLabel.text = _formModel.indicatorLeftTitle;
    _indicatorLeftLabel.numberOfLines = _formModel.numLineOfIdtLeftLabel;
    _indicatorLeftImageView.image = _formModel.indicatorLeftImage;
    _indicatorLeftTextField.keyboardType = _formModel.indicatorLeftTextKeyBoardType;
    _indicatorLeftTextField.text = _formModel.indicatorLeftText;
    _indicatorLeftTextField.textColor = _formModel.indicatorLeftTextColor;
    _indicatorLeftTextField.placeholder = _formModel.indicatorLeftTextplaceholder;
    
    _indicatorLeftLabel.hidden = _formModel.isShowText;
    _indicatorLeftTextField.hidden = !_formModel.isShowText;
    _indicatorLeftTextField.secureTextEntry = _formModel.isSecureTextEntry;
}

#pragma mark- CallBack
- (void)switchTouched:(UISwitch *)indicatorSwitch
{
    if (self.formModel.switchValueChangedCallBack){
        self.formModel.switchValueChangedCallBack(indicatorSwitch.isOn);
    }
}


#pragma mark- Getter
- (UIImageView *)leftImageView{
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc] init];
    }
    return _leftImageView;
}

- (UILabel *)leftTitleLabel{
    if (!_leftTitleLabel) {
        _leftTitleLabel= [[UILabel alloc] init];
    }
    return _leftTitleLabel;
}


- (UISwitch *)indicatorSwitch{
    if (!_indicatorSwitch) {
        _indicatorSwitch = [[UISwitch alloc] init];
    }
    return _indicatorSwitch;
}

- (UIImageView *)indicatorArrow{
    if (!_indicatorArrow) {
        _indicatorArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:CYIndicatorArrow]];
    }
    return _indicatorArrow;
}

- (UILabel *)indicatorLeftLabel{
    if (!_indicatorLeftLabel) {
        _indicatorLeftLabel = [[UILabel alloc] init];
    }
    return _indicatorLeftLabel;
}

- (UIButton *)indicatorBtn{
    if (!_indicatorBtn) {
        _indicatorBtn = [UIButton new];
    }
    return _indicatorBtn;
}

-(UITextField *)indicatorLeftTextField{
    if (!_indicatorLeftTextField) {
        _indicatorLeftTextField = [[UITextField alloc] init];
    }
    return _indicatorLeftTextField;
}

- (UIImageView *)indicatorLeftImageView{
    if (!_indicatorLeftImageView) {
        _indicatorLeftImageView = [[UIImageView alloc] init];
    }
    return _indicatorLeftImageView;
}
@end

#pragma mark LeftTextAccessoryIdtTextImg
@implementation CYCommonFormCell (LeftTextAccessoryIdtTextImg)

- (void)layoutLeftTextAccessoryIdtTextImgWithCellModel:(CYCommonFormModel *)formModel{
    if (self.contentView.subviews.count == 0) {
        [self setupLeftTextAccessoryIdtTextSubviews];
    }
    self.formModel = formModel;
}

- (void)setupLeftTextAccessoryIdtTextSubviews{
    [self.contentView addSubview:self.leftTitleLabel];
    [self.contentView addSubview:self.indicatorLeftTextField];
    [self.contentView addSubview:self.indicatorLeftLabel];
    [self.contentView addSubview:self.indicatorLeftImageView];
    [self.contentView addSubview:self.indicatorArrow];
    
    [self.leftTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).offset(CYLeftMargin);
    }];
    
    [self.indicatorArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@25);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).offset(-CYRightMargin);
    }];
    
    [self.indicatorLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.indicatorArrow.mas_left);
        make.left.greaterThanOrEqualTo(self.leftTitleLabel.mas_right).offset(CYLeftMiddleMargin);
    }];
    
    [self.indicatorLeftTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.indicatorLeftLabel);
    }];
    
    [self.indicatorLeftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.indicatorArrow.mas_left).offset(-CYRightMiddleMargin);
    }];
}
@end
