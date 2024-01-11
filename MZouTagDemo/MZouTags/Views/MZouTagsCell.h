//
//  MZouTagsCell.h
//  MZouTagDemo
//
//  Created by mzou on 2020/9/22.
//  Copyright © 2020 MZou. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MZouTagsModel;
NS_ASSUME_NONNULL_BEGIN

@interface MZouTagsCell : UICollectionViewCell


/// 数据眼
@property (nonatomic, strong) MZouTagsModel *model;

@end

NS_ASSUME_NONNULL_END
