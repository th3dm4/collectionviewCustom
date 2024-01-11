//
//  MZouTagsView.m
//  MZouTagDemo
//
//  Created by mzou on 2020/9/22.
//  Copyright © 2020 MZou. All rights reserved.
//

#import "MZouTagsView.h"
#import "MZouTagsModel.h"
#import "UICollectionViewLeftAlignedLayout.h"
#import "MZouTagsCell.h"

@interface MZouTagsView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation MZouTagsView

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]){
        [self prepareUI];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self prepareUI];
    }
    return self;
}

#pragma mark - 准备界面
- (void)prepareUI {
    
    //collection布局
    UICollectionViewLeftAlignedLayout *layout = [[UICollectionViewLeftAlignedLayout alloc] init];
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(10, 13, 10, 10);
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                                          collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.alwaysBounceVertical = NO;
    collectionView.alwaysBounceHorizontal = NO;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [self addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.right.and.bottom.equalTo(self);
    }];
    self.collectionView = collectionView;
    
    [collectionView registerClass:[MZouTagsCell class]
       forCellWithReuseIdentifier:@"MZouTagsCell"];
    
    __weak typeof(self) weakSelf = self;
    [collectionView performBatchUpdates:^{
        NSLog(@"正在进行刷新界面中");
    } completion:^(BOOL finished) {
        NSLog(@"界面刷新结束！！");
        if (weakSelf.reloadCollectionView) {
            weakSelf.reloadCollectionView(collectionView.contentSize.height);
        }
    }];
}

#pragma mark - UICollectionView 数据源
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.listArrM.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MZouTagsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MZouTagsCell"
                                                                   forIndexPath:indexPath];
    MZouTagsModel *model = self.listArrM[indexPath.row];
    cell.tag = indexPath.row;
    cell.model = model;
    return cell;
}


#pragma mark - collectionView的代理方法
//设置item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MZouTagsModel *model  = self.listArrM[indexPath.row];

    CGFloat width = [self getWidthWithText:(model.alias == nil || [model.alias isEqualToString:@""]) ? model.name : model.alias
                                    height:30
                                      font:13];
    
    return CGSizeMake(width + 25, 30.0f);
}


/// 选中标签
/// @param collectionView collectView
/// @param indexPath idnexPath
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [collectionView deselectItemAtIndexPath:indexPath animated:NO];
    
    for (int i = 0; i < self.listArrM.count; ++i) {
        MZouTagsModel *model = self.listArrM[i];
        if (indexPath.row == i) {
            model.isSelect = YES;
            if (self.signSelectTag) {
                self.signSelectTag(model);
            }
        } else {
            model.isSelect = NO;
        }
    }
    
    [collectionView reloadData];
}



#pragma  mark - 私有方法

/// 根据高度度求宽度
/// @param text     计算的内容
/// @param height   计算的高度
/// @param font     字体大小
- (CGFloat)getWidthWithText:(NSString *)text
                     height:(CGFloat)height
                       font:(CGFloat)font {
    
    if (text == nil || [text isEqualToString:@""]) {
        text = @"无";
    }
    if (font <= 0) {
        font = 13;
    }
    if (height < 0) {
        height = 0;
    }

    CGRect rect = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, height)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}
                                     context:nil];
    NSLog(@"%@ 的宽度为：%lf",text,rect.size.width);
    return rect.size.width;
}

#pragma mark - 懒加载
- (NSMutableArray *)listArrM {
    if (!_listArrM) {
        _listArrM = [NSMutableArray array];
    }
    return _listArrM;
}


@end
