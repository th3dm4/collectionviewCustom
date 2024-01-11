//
//  ViewController.m
//  MZouTagDemo
//
//  Created by mzou on 2020/9/22.
//  Copyright © 2020 MZou. All rights reserved.
//

#import "ViewController.h"
#import "MZouTagsView.h"
#import "MZouTagsModel.h"


@interface ViewController ()

/// 数据源
@property (nonatomic, strong) NSMutableArray *listArrM;

/// 视图
@property (nonatomic, weak) MZouTagsView *tagView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self prepareUI];
    [self value];
}

#pragma mark - 准备页面
- (void)prepareUI {
    
    MZouTagsView *tagView = [[MZouTagsView alloc] init];
    tagView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tagView];
    [tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(13);
        make.right.equalTo(self.view.mas_right).offset(-13);
        make.centerX.and.centerY.equalTo(self.view);
        make.height.mas_equalTo(20);
    }];
    self.tagView = tagView;
    tagView.listArrM = self.listArrM;
    
    __weak typeof(self) weakSelf = self;
    tagView.reloadCollectionView = ^(CGFloat updateHeight) {
        NSLog(@"返回的高度为：%lf",updateHeight);
        [weakSelf.tagView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.view.mas_left).offset(13);
            make.right.equalTo(weakSelf.view.mas_right).offset(-13);
            make.centerX.and.centerY.equalTo(weakSelf.view);
            make.height.mas_equalTo(updateHeight);
        }];
    };
    
    tagView.signSelectTag = ^(MZouTagsModel * _Nonnull model) {
        NSString *selectTagStr = (model.alias == nil || [model.alias isEqualToString:@""]) ? model.name : model.alias;
        NSLog(@"选中的标签的名字为：%@",selectTagStr);
    };
}

#pragma mark - 数据源
- (void)value {
    
    [self.listArrM removeAllObjects];
    
    MZouTagsModel *model = [[MZouTagsModel alloc] init];
    model.name = @"压缩";
    model.isSelect = NO;
    model.defaultColor = [UIColor lightGrayColor];
    model.selectColor = [UIColor blueColor];
    
    MZouTagsModel *model1 = [[MZouTagsModel alloc] init];
    model1.name = @"药剂";
    model1.isSelect = NO;
    model1.defaultColor = [UIColor lightGrayColor];
    model1.selectColor = [UIColor blueColor];
    
    MZouTagsModel *model2 = [[MZouTagsModel alloc] init];
    model2.name = @"炮娘";
    model2.isSelect = NO;
    model2.defaultColor = [UIColor lightGrayColor];
    model2.selectColor = [UIColor blueColor];
    
    MZouTagsModel *model3 = [[MZouTagsModel alloc] init];
    model3.name = @"黑人奥巴马黑人奥巴马";
    model3.isSelect = NO;
    model3.defaultColor = [UIColor lightGrayColor];
    model3.selectColor = [UIColor blueColor];
    
    MZouTagsModel *model4 = [[MZouTagsModel alloc] init];
    model4.name = @"无敌大狗头";
    model4.isSelect = NO;
    model4.defaultColor = [UIColor lightGrayColor];
    model4.selectColor = [UIColor blueColor];
    
    MZouTagsModel *model5 = [[MZouTagsModel alloc] init];
    model5.name = @"飞天螳螂";
    model5.isSelect = NO;
    model5.defaultColor = [UIColor lightGrayColor];
    model5.selectColor = [UIColor blueColor];
    
    MZouTagsModel *model6 = [[MZouTagsModel alloc] init];
    model6.name = @"快乐风男";
    model6.isSelect = NO;
    model6.defaultColor = [UIColor lightGrayColor];
    model6.selectColor = [UIColor blueColor];
    
    MZouTagsModel *model7 = [[MZouTagsModel alloc] init];
    model7.name = @"小薇恩";
    model7.isSelect = NO;
    model7.defaultColor = [UIColor lightGrayColor];
    model7.selectColor = [UIColor blueColor];
    
    MZouTagsModel *model8 = [[MZouTagsModel alloc] init];
    model8.name = @"小薇恩sfjshdf9s dfi iui ";
    model8.isSelect = NO;
    model8.defaultColor = [UIColor lightGrayColor];
    model8.selectColor = [UIColor blueColor];
    
    
    [self.listArrM addObject:model];
    [self.listArrM addObject:model1];
    [self.listArrM addObject:model2];
    [self.listArrM addObject:model3];
    [self.listArrM addObject:model4];
    [self.listArrM addObject:model5];
    [self.listArrM addObject:model6];
    [self.listArrM addObject:model7];
    [self.listArrM addObject:model8];
    
    [self.tagView.collectionView reloadData];
}




#pragma mark - 懒加载
- (NSMutableArray *)listArrM {
    if (!_listArrM) {
        _listArrM = [NSMutableArray array];
    }
    return _listArrM;
}



@end
