//
//  CYCommonFormController.m
//  CYCommonForm
//
//  Created by cy on 09/09/2017.
//  Copyright © 2017 com.jiemu.commonForm. All rights reserved.
//

#import "CYCommonFormController.h"
#import "CYCommonFormConst.h"

@interface CYCommonFormController (){
    CYDataType _dataType;
}

@end

@implementation CYCommonFormController

- (instancetype)init
{
    self = [self initWithDataType:CYDataTypeExist];
    return self;
}

- (instancetype)initWithDataType:(CYDataType)dataType{
    self = [super init];
    if (self) {
        _dataType = dataType;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (_dataType == CYDataTypeExist) {
        [self configTableView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configTableView{
    [self loadDataSource];
    [self createTableView];
}

- (void)loadDataSource{}

- (void)createTableView {
    
    if (!self.tableView) {
        self.tableView = [[CYCommonFormView alloc] initWithFrame:CGRectMake(0, 0, CYScreenWidth, CYScreenHeight)  style:UITableViewStyleGrouped];
        self.tableView.dataSourceDelegate = self.dataSource;
        [self.view addSubview:self.tableView];
    }
}
@end
