//
//  ViewController2.m
//  PageViewDemo
//
//  Created by Linyou-IOS-1 on 16/5/10.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController1.h"
@interface ViewController2 ()

@end

@implementation ViewController2
-(NSUInteger)pageIndex
{
    return 2;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor purpleColor];
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(20, 150, 90, 30)];
    btn.backgroundColor=[UIColor blueColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(navigationto) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}
-(void)navigationto
{
    ViewController1 *vc=[[ViewController1 alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
