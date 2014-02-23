//
//  XFViewController.m
//  Quartz 2D 给图像添加水印
//
//  Created by 王小飞您 on 13-8-4.
//  Copyright (c) 2013年 wangxiaofei. All rights reserved.
//

#import "XFViewController.h"

@interface XFViewController ()

@end

@implementation XFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.demoView.image = [self createImage];
}

#pragma mark 给图像添加水印
- (UIImage *)createImage
{
    // 1. 获得图像上下文
    UIGraphicsBeginImageContext(CGSizeMake(320, 200));
    
    // 2. 加载图像， 把图像画在特定区域
    UIImage *image = [UIImage imageNamed:@"NatGeo01.png"];
    [image drawInRect:CGRectMake(0, 0, 320, 200)];
    
    // 3. 设置水印文字
    NSString *word = @"@王小飞您";
    
    // 颜色
    UIColor *color = [UIColor colorWithRed:1 green:1 blue:0 alpha:1];
    [color set];
    
    // 画 文字 (rect是相对于图像上得位置)
    [word drawInRect:CGRectMake(0, 170, 320, 20) withFont:[UIFont systemFontOfSize:12] lineBreakMode:NSLineBreakByWordWrapping alignment:NSTextAlignmentRight];
    
    // 4. 从图像上下文中获得当前绘制的结果 生产图像
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5. 关闭上下文图像
    UIGraphicsEndImageContext();
    
    // 6. 把图像归档，可以用这个方法来做缩略图
    //    NSArray *documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //    NSString *path = [documents[0]stringByAppendingPathComponent:@"image.png"];

    // 归档到桌面
    NSString *path = @"/Users/wanghongfei/Desktop/image.png";
    
    NSData *imageData = UIImagePNGRepresentation(result);
    
    [imageData writeToFile:path atomically:YES];
    
    return result;
}

@end
