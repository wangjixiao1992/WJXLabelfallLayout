//
//  WJXWaterfallLayout.m
//  WaterFallDemo
//
//  Created by wangjixiao on 2018/6/12.
//  Copyright © 2018年 lmh. All rights reserved.
//

#import "WJXLabelfallLayout.h"

@interface WJXLabelfallLayout()
//布局属性
@property (nonatomic, strong) NSMutableArray * attrsArray;
//列的当前宽度
@property (nonatomic, assign) CGFloat contentOffsetX;
@property (nonatomic, assign) CGFloat contentOffsetY;

@end

@implementation WJXLabelfallLayout

/**
 * 初始化 (相当于init)
 */
- (void)prepareLayout
{
    [super prepareLayout];
    
    self.contentOffsetX = self.sectionInset.left;
    self.contentOffsetY = self.sectionInset.top;
    // 清楚之前所有的布局属性
    self.attrsArray = nil;
    // 开始创建每一个cell对应的布局属性
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < count; i++) {
        // 创建位置
        NSIndexPath * indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        // 获取indexPath位置上cell对应的布局属性
        UICollectionViewLayoutAttributes * attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArray addObject:attrs];
    }
}
/**
 * 决定cell的高度
 */
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;
}

/**
 * 内容的高度
 */
- (CGSize)collectionViewContentSize
{
    CGFloat maxHeight = self.contentOffsetY + self.sectionInset.bottom + self.itemSize.height;
    NSLog(@"%f", maxHeight);
    return CGSizeMake(self.collectionView.frame.size.width, maxHeight);
}

/**
 * 返回indexPath位置cell对应的布局属性
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat viewWidth = self.collectionView.frame.size.width;
    CGFloat offsetX = self.minimumInteritemSpacing;
    CGFloat offsetY = self.minimumLineSpacing;

    //获取cell的大小
    CGFloat layoutViewWidth = 0;
    if ([self.delegate respondsToSelector:@selector(waterFallLayout:WidthForItemAtIndexPath:)]) {
        layoutViewWidth = [self.delegate waterFallLayout:self WidthForItemAtIndexPath:indexPath];
    }
    
    CGFloat layoutViewHeight = self.itemSize.height;
    // 创建布局属性
    UICollectionViewLayoutAttributes * attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGFloat layoutWidth = layoutViewWidth;
    CGFloat layoutHeight = layoutViewHeight;
    CGFloat layoutX = self.contentOffsetX;
    CGFloat layoutY = self.contentOffsetY;
    if (layoutX + layoutWidth > viewWidth - self.sectionInset.right) {
        self.contentOffsetX = self.sectionInset.left;
        self.contentOffsetY = self.contentOffsetY + layoutHeight + offsetY;
        layoutX = self.contentOffsetX;
        layoutY = self.contentOffsetY;
    }
    attrs.frame = CGRectMake(layoutX, layoutY, layoutWidth, layoutHeight);
    self.contentOffsetX = CGRectGetMaxX(attrs.frame) + offsetX;
    return attrs;
}

#pragma mark 懒加载
- (NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _attrsArray;
}


@end
