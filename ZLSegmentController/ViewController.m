//
//  ViewController.m
//  ZLSegmentController
//
//  Created by Mac on 15/12/28.
//  Copyright © 2015年 zhanglei. All rights reserved.
//

#import "ViewController.h"
#import "ZLSegment.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray * array = [NSMutableArray array];
    [array addObject:@"头条新闻"];
    [array addObject:@"推荐新闻"];
    [array addObject:@"娱乐新闻"];
    [array addObject:@"体育新闻"];
    
    ZLSegment * segment = [[ZLSegment alloc] initWithFrame:CGRectMake(10, 60, [UIScreen mainScreen].bounds.size.width-20, 40)];
    [segment setWithTitles:array];
    [segment setTitleBackColor:[UIColor redColor]];
    [segment setTitleFrontColor:[UIColor yellowColor]];
    [segment setButtonColor:[UIColor blueColor]];
    [segment setButtonRadius:2];
    [segment setDelegate:self];
    [self.view addSubview:segment];
}

-(void)zlSegmentSelect:(NSInteger)selectIndex{
    NSLog(@"select Button At Index:%ld",(long)selectIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
