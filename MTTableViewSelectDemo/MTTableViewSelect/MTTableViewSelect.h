//
//  MTTableViewSelect.h
//  MTTableViewSelectDemo
//
//  Created by 王翔 on 16/8/2.
//  Copyright © 2016年 WangXiangMT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTTableViewSelect : UIView

@property (nonatomic,assign) CGRect rect;

// frame 尺寸
// selectData 选择控件的数据源
// action 点击回调的方法
// animate 是否弹出动画
+ (void)addMTTableViewSelectWithWindowFrame:(CGRect)frame
                                   selectData:(NSArray *)selectData
                                       images:(NSArray *)images
                                       action:(void(^)(NSInteger index))action animated:(BOOL)animate;

//隐藏
+ (void)hiden;

@end
