//
//  MZouTagsView.h
//  MZouTagDemo
//
//  Created by mzou on 2020/9/22.
//  Copyright © 2020 MZou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MZouTagsModel;
NS_ASSUME_NONNULL_BEGIN

@interface MZouTagsView : UIView

/// collectionView
@property (nonatomic, strong) UICollectionView *collectionView;

/// 数据源
@property (nonatomic, strong) NSMutableArray *listArrM;

/// 刷新collectionView后的高度回调
@property (nonatomic, copy) void (^reloadCollectionView)(CGFloat updateHeight);

/// 选中标签的模型
@property (nonatomic, copy) void (^signSelectTag)(MZouTagsModel *model);

@end

NS_ASSUME_NONNULL_END
