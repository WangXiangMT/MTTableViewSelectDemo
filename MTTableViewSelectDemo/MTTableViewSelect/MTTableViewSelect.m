//
//  MTTableViewSelect.m
//  MTTableViewSelectDemo
//
//  Created by 王翔 on 16/8/2.
//  Copyright © 2016年 WangXiangMT. All rights reserved.
//

#import "MTTableViewSelect.h"
#define  LeftView 10.0f
#define  TopToView 10.0f

@interface MTTableViewSelect()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,copy) NSArray *selectData;

@property (nonatomic,copy) void(^action)(NSInteger index);

@property (nonatomic,copy) NSArray * imagesData;

@end

MTTableViewSelect *backgroundView;

UITableView * tableView;

@implementation MTTableViewSelect

- (instancetype)init{
    if (self = [super init]) {
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

+ (void)addPellTableViewSelectWithWindowFrame:(CGRect)frame
                                   selectData:(NSArray *)selectData
                                       images:(NSArray *)images
                                       action:(void(^)(NSInteger index))action animated:(BOOL)animate
{
    if (backgroundView != nil) {
        [MTTableViewSelect hiden];
    }
    UIWindow *win = [[[UIApplication sharedApplication] windows] firstObject];
    backgroundView = [[MTTableViewSelect alloc] initWithFrame:win.bounds];
    backgroundView.action = action;
    backgroundView.imagesData = images ;
    backgroundView.selectData = selectData;
    backgroundView.backgroundColor = [UIColor colorWithHue:0
                                                saturation:0
                                                brightness:0 alpha:0.1];
    [win addSubview:backgroundView];
    backgroundView.rect = frame;
    
    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(frame.origin.x,frame.origin.y , frame.size.width, 40 * selectData.count) style:0];
    tableView.dataSource = backgroundView;
    tableView.delegate = backgroundView;
    tableView.layer.cornerRadius = 10.0f;
    // 定点
    tableView.layer.anchorPoint = CGPointMake(1.0, 0);
    tableView.transform =CGAffineTransformMakeScale(0.0001, 0.0001);
    tableView.rowHeight = 40;
    [win addSubview:tableView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBackgroundClick)];
    [backgroundView addGestureRecognizer:tap];
    
    
    
    if (animate == YES) {
        backgroundView.alpha = 0;
        [UIView animateWithDuration:0.3 animations:^{
            backgroundView.alpha = 0.5;
            tableView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
    }
}
+ (void)tapBackgroundClick
{
    [MTTableViewSelect hiden];
}
+ (void)hiden
{
    if (backgroundView != nil) {
        
        [UIView animateWithDuration:0.3 animations:^{
            tableView.transform = CGAffineTransformMakeScale(0.000001, 0.0001);
        } completion:^(BOOL finished) {
            [backgroundView removeFromSuperview];
            [tableView removeFromSuperview];
            tableView = nil;
            backgroundView = nil;
        }];
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _selectData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"PellTableViewSelectIdentifier";
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:Identifier];
    }
    cell.textLabel.text = _selectData[indexPath.row];
    //    cell.textLabel.textColor = BGCOLOR;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.action) {
        self.action(indexPath.row);
    }
    [MTTableViewSelect hiden];
}



#pragma mark 绘制三角形
- (void)drawRect:(CGRect)rect

{
    // 设置背景色
    [[UIColor whiteColor] set];
    //拿到当前视图准备好的画板
    
    CGContextRef  context = UIGraphicsGetCurrentContext();
    
    //利用path进行绘制三角形
    
    CGContextBeginPath(context);//标记
    CGFloat x = self.rect.origin.x;
    CGContextMoveToPoint(context,x+50, self.rect.origin.y+60);//设置起点
    
    CGContextAddLineToPoint(context,x+40,  self.rect.origin.y+50);
    CGContextAddLineToPoint(context,x +30, self.rect.origin.y+60);
    CGContextClosePath(context);//路径结束标志，不写默认封闭
    
    [[UIColor whiteColor] setFill];  //设置填充色
    [[UIColor whiteColor] setStroke]; //设置边框颜色
    CGContextDrawPath(context,
                      kCGPathFillStroke);//绘制路径path
    
    //    [self setNeedsDisplay];
}



@end
