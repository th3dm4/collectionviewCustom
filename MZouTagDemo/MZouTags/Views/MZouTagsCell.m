//
//  MZouTagsCell.m
//  MZouTagDemo
//
//  Created by mzou on 2020/9/22.
//  Copyright © 2020 MZou. All rights reserved.
//

#import "MZouTagsCell.h"
#import "MZouTagsModel.h"

@interface MZouTagsCell()

//标签按钮
@property (nonatomic, strong) UIButton *tagBtn;

@end

@implementation MZouTagsCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self prepareUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self prepareUI];
    }
    return self;
}


#pragma mark - 准备界面
- (void)prepareUI {
    //设置背景颜色
    self.backgroundColor = [UIColor whiteColor];
    
    //标签按钮
    UIButton *tagBtn = [[UIButton alloc] init];
    tagBtn.layer.cornerRadius = 15.0f;
    tagBtn.layer.masksToBounds = YES;
    tagBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    tagBtn.userInteractionEnabled = NO;
    [tagBtn setTitleColor:[UIColor whiteColor]
                 forState:UIControlStateNormal];
    [self addSubview:tagBtn];
    [tagBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.right.and.bottom.equalTo(self);
    }];
    _tagBtn = tagBtn;
    
}


#pragma mark - 设置数据源
- (void)setModel:(MZouTagsModel *)model {
    _model = model;
    if (model.name == nil) {
        model.name = @"";
    }
    
    [_tagBtn setTitle:(model.alias == nil || [model.alias isEqualToString:@""]) ? model.name : model.alias
             forState:UIControlStateNormal];
    
    if (model.isSelect)
        _tagBtn.backgroundColor = model.selectColor;
    else
        _tagBtn.backgroundColor = model.defaultColor;
    
}

@end
