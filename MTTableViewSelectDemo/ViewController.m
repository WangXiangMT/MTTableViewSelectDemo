//
//  ViewController.m
//  MTTableViewSelectDemo
//
//  Created by 王翔 on 16/8/2.
//  Copyright © 2016年 WangXiangMT. All rights reserved.
//

#import "ViewController.h"
#import "MTTableViewSelect.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSArray *array = [NSArray arrayWithObjects:@"选择1",@"选择2", nil];
    
    [MTTableViewSelect addMTTableViewSelectWithWindowFrame:CGRectMake(250, 200, 150, 40) selectData:array images:nil action:^(NSInteger index) {
        if (index == 0) {
            NSLog(@"点击了选择1");
        }else {
            NSLog(@"点击了选择2");
        }
    } animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
