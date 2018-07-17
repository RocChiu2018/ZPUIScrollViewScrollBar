//
//  ViewController.m
//  scrollView的滚动条
//
//  Created by apple on 16/5/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%@", self.scrollView.subviews);
    
    //代码方式创建UIScrollView控件
//    UIScrollView *scrollView = [[UIScrollView alloc] init];
//    scrollView.frame = CGRectMake(30, 50, 250, 250);
//    scrollView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:scrollView];
//    NSLog(@"%@", scrollView.subviews);

    for (int i = 0; i < 50; i++)
    {
        int row = i/3;
        int col = i%3;

        CGFloat x = col * (50 + 10);
        CGFloat y = row * (50 + 10);

        [self addGridWithX:x y:y scrollView:self.scrollView];
    }

    /**
     如果是在xib上面创建的UIScrollView控件的话则它的子控件就包括横向和纵向滚动条，在UIScrollView控件上添加子控件之后，如果要用lastObject方法获取最后一个子控件的话，很有可能获取到的是滚动条，这样就与初衷相反了，所以一般先把滚动条隐藏，再获取最后一个子控件；
     如果是用代码的方式创建的UIScrollView控件的话则它的子控件不包括横向和纵向滚动条，所以在UIScrollView控件上添加子控件之后就没必要先把滚动条隐藏了再用lastObject方法获取最后一个子控件了，直接获取子控件即可。
     */
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    UIView *lastView = [self.scrollView.subviews lastObject];  //获取最后一个格子
    
    CGFloat contentH = CGRectGetMaxY(lastView.frame);  //获取最后一个格子的Y的最大值
    self.scrollView.contentSize = CGSizeMake(0, contentH);
    
    NSLog(@"%lu", (unsigned long)self.scrollView.subviews.count);
    NSLog(@"%@", self.scrollView.subviews);
}

#pragma mark ————— 创建格子 —————
-(void)addGridWithX:(CGFloat)x y:(CGFloat)y scrollView:(UIScrollView *)scrollView
{
    UIView *grid = [[UIView alloc] init];
    grid.frame = CGRectMake(x, y, 50, 50);
    grid.backgroundColor = [UIColor blueColor];
    [self.scrollView addSubview:grid];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
