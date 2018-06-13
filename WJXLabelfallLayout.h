//
//  WJXWaterfallLayout.h
//  WaterFallDemo
//
//  Created by wangjixiao on 2018/6/12.
//  Copyright © 2018年 lmh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WJXLabelfallLayout;

@protocol  WJXWaterfallLayoutDeleaget<NSObject>


@required
/**
 * 每个item的宽度
 */
- (CGFloat)waterFallLayout:(WJXLabelfallLayout *)waterFallLayout WidthForItemAtIndexPath:(NSIndexPath *)indexPath;


@end

@interface WJXLabelfallLayout : UICollectionViewFlowLayout


@property (nonatomic, weak) id<WJXWaterfallLayoutDeleaget> delegate;

@end
