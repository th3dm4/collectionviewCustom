//
//  MZouTagsModel.h
//  MZouTagDemo
//
//  Created by mzou on 2020/9/22.
//  Copyright © 2020 MZou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZouTagsModel : NSObject

/// 标签名字
@property (nonatomic, copy) NSString *name;
/// 别名
@property (nonatomic, copy) NSString *alias;

/// 标签名字颜色
@property (nonatomic, strong) UIColor *textColor;
/// 是否选中
@property (nonatomic, assign) BOOL isSelect;

/// 默认颜色
@property (nonatomic, strong) UIColor *defaultColor;
/// 选中颜色
@property (nonatomic, strong) UIColor *selectColor;


@end

NS_ASSUME_NONNULL_END
