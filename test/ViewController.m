//
//  ViewController.m
//  test
//
//  Created by WengVic on 2015/5/7.
//  Copyright (c) 2015年 WengVic. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *array = [[NSMutableArray alloc]init];
    [array addObject:[UIImage imageNamed:@"01.png"]];
    [array addObject:[UIImage imageNamed:@"02.png"]];
    self.myImg01.contentMode = UIViewContentModeScaleToFill;
    self.myImg01.animationImages = array;
    self.myImg01.animationDuration = 1 ;
   [self.myImg01 startAnimating];
}
//如畫面被點擊後放開,會改變螢幕顏色


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch =  [touches anyObject];
    if(touch.tapCount == 1)
    {
        [self performSelector:@selector(setBackground:) withObject:[UIColor blueColor] afterDelay:2];
        self.view.backgroundColor = [UIColor redColor];
        
        
        UIViewController *vc = [self .storyboard instantiateViewControllerWithIdentifier:@"abc"];
        [self showDetailViewController:vc sender:self];
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
