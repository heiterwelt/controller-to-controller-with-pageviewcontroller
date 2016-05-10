//
//  PageContentViewController.m
//  PageViewDemo
//
//  Created by HEYANG on 16/5/3.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *ivScreenImage;
@property (weak, nonatomic) IBOutlet UILabel *lblScreenLabel;



@end

@implementation PageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ivScreenImage.image = [UIImage imageNamed:self.imgFile];
    self.lblScreenLabel.text = self.txtTitle;
    NSLog(@"%lu",(unsigned long)self.pageIndex);
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
