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

//如畫面被點擊後放開
//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    UITouch *touch =  [touches anyObject];
//    if(touch.tapCount == 1)
//    {
//        UIViewController *abc = [self.storyboard instantiateViewControllerWithIdentifier:@"vc"];
//        [self showDetailViewController:abc sender:self];
//        
//    }
//}
//更改圖片位置
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    _myImg03.frame = CGRectMake(0 , -_myImg03.frame.size.height, 0, _myImg03.frame.size.height);
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    NSLog(@"觸碰移動");
    
   
}




@end




