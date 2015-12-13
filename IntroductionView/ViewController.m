//
//  ViewController.m
//  IntroductionView
//
//  Created by 谢霆锋 on 15/12/13.
//  Copyright © 2015年 lll. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView *rootView;
}
@property (nonatomic, strong) EAIntroView *intro;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    rootView = self.view;
    [self showIntroWithCustomView];
}
#pragma  mark 引导图
- (void)showIntroWithCustomView {
    
    UIImageView *image1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1.png"]];
    image1.frame = rootView.bounds;
    EAIntroPage *page1 = [EAIntroPage pageWithCustomView:image1];
    
    UIImageView *image2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide2.png"]];
    image2.frame = rootView.bounds;
    EAIntroPage *page2 = [EAIntroPage pageWithCustomView:image2];
    
    CGFloat w = CGRectGetWidth(self.view.bounds);
    UIButton *lastguidebtn = [[UIButton alloc]initWithFrame:CGRectMake((w - 100)/2, rootView.bounds.size.height - 100, 100, 29)];
    [lastguidebtn setImage:[UIImage imageNamed:@"lastguidebtn.png"] forState:UIControlStateNormal];
    [lastguidebtn addTarget:self action:@selector(gotoMain:) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *image3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide3.png"]];
    image3.frame = rootView.bounds;
    image3.userInteractionEnabled = YES;
    [image3 addSubview:lastguidebtn];
    EAIntroPage *page3 = [EAIntroPage pageWithCustomView:image3];
    
    UIImageView *image4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1.png"]];
    image4.frame = rootView.bounds;
    EAIntroPage *page4 = [EAIntroPage pageWithCustomView:image4];
    self.intro = [[EAIntroView alloc] initWithFrame:rootView.bounds andPages:@[page1,page2,page4,page3]];
    [self.intro.skipButton setTitle:@"跳过" forState:UIControlStateNormal];
    [self.intro setDelegate:self];
    [self.intro showInView:rootView animateDuration:0.3];
}
-(void)gotoMain:(UIButton *)btn{
    [self.intro hideWithFadeOutDuration:0.3];
    NSLog(@"引导结束");
 
}
- (void)introDidFinish:(EAIntroView *)introView {
    NSLog(@"引导结束");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
