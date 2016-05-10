//
//  RootViewController.m
//  PageViewDemo
//
//  Created by HEYANG on 16/5/3.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "RootViewController.h"

#import "PageContentViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
@interface RootViewController () <UIPageViewControllerDataSource>

@property (nonatomic,strong) UIPageViewController *PageViewController;
@property (nonatomic,strong) NSArray *arrPageTitles;
@property (nonatomic,strong) NSArray *arrPageImages;


- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index;

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _arrPageTitles = @[@"This is The App Guruz",@"This is Table Tennis 3D",@"This is Hide Secrets"];
    _arrPageImages =@[@"1.jpg",@"2.jpg",@"3.jpg"];
    
    // 通过storyboard的storyboard ID可以拿到当前storyboard里面的控制器界面
    // Create page view controller
    self.PageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    
    self.PageViewController.dataSource = self;
    
    // 1、创建子控制器
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    // 2、存储在数组中
    NSArray *viewControllers = @[startingViewController];
    // 3、UIPageController添加这个数组
    /*
    NavigationOrientation设定了翻页方向，
        UIPageViewControllerNavigationDirection枚举类型定义了以下两种翻页方式。
    UIPageViewControllerNavigationDirectionForward：从左往右（或从下往上）；
    UIPageViewControllerNavigationDirectionReverse：从右向左（或从上往下）
     */
    [self.PageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    
    // Change the size of page view controller
    self.PageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    // hy:当前的这个self = UIViewController添加这个UIPageViewController作为子控制器
    [self addChildViewController:_PageViewController];
    // hy:但是也别忘了还需要添加View到当前View上
    [self.view addSubview:_PageViewController.view];
    
    
    /*
     当我们向我们的视图控制器容器（就是父视图控制器，它调用addChildViewController
     方法加入子视图控制器，它就成为了视图控制器的容器）中添加（或者删除）子视图控制器
     后，必须调用该方法，告诉iOS，已经完成添加（或删除）子控制器的操作。
     */
    [self.PageViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIPageViewDatasource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    // 获得当前的控制器对应的index，然后-1，创建前面一个控制器，然后返回
//    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
//    if ((index == 0) || (index == NSNotFound))
//    {
//        return nil;
//    }
//    index--;
//    return [self viewControllerAtIndex:index];
    
    if ([viewController isKindOfClass:[ViewController2 class]]) {
        ViewController1 *vc=[[ViewController1 alloc]init];
        return vc;
        
    }else if ([viewController isKindOfClass:[ViewController1 class]]){
        PageContentViewController *vc=[[PageContentViewController alloc]init];
        return vc;
    }
    else{
        PageContentViewController *vc=[[PageContentViewController alloc]init];
        return vc;
    }

}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{   // 获得当前的控制器对应的index，然后+1，创建后面一个控制器，然后返回
    if ([viewController isKindOfClass:[PageContentViewController class]]) {
        ViewController1 *vc=[[ViewController1 alloc]init];
        return vc;

    }else if ([viewController isKindOfClass:[ViewController1 class]]){
        ViewController2 *vc=[[ViewController2 alloc]init];
        return vc;
    }
    else{
        PageContentViewController *vc=[[PageContentViewController alloc]init];
        return vc;
    }
}
-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    // 返回控制器的个数
    return [self.arrPageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    // 返回首次显示的控制器 放在第index+1页显示
    // 比如这里首次显示的会在第3页显示
    // return 2;
    
    // 一般这里返回0
    return 0;
}

// hy:自定义声明的方法
- (UIViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.arrPageTitles count] == 0) || (index >= [self.arrPageTitles count])) {
        return nil;
    }
    if (index==0) {
        PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
        pageContentViewController.imgFile = self.arrPageImages[index];
        pageContentViewController.txtTitle = self.arrPageTitles[index];
        pageContentViewController.pageIndex = index;
        return pageContentViewController;

    }else if (index==1){
    
        ViewController1 *vc=[[ViewController1 alloc]init];
        return vc;
    }else if (index==2){
        ViewController2 *vc=[[ViewController2 alloc]init];
        return vc;
        
    }else{
        ViewController1 *vc=[[ViewController1 alloc]init];
        return vc;
    }
    
    return nil;
    // Create a new view controller and pass suitable data.
}


- (IBAction)btnStartAgain:(UIButton *)sender {
    UIViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.PageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
}



@end
