//
//  ViewController.m
//  UIViewFlipTest
//
//  Created by Chris Milne on 1/17/13.
//  Copyright (c) 2013 Chris Milne. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    int imageIndex;
}
@end

@implementation ViewController

@synthesize mContainerView = _mContainerView;
@synthesize mInitialImageView = _mInitialImageView;

- (void)viewDidLoad {
    [super viewDidLoad];
    imageIndex = 0;
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan");
    
    UIImageView *flipImage;
    if(0 == imageIndex) {
        flipImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BOX2.png"]];
        imageIndex = 1;
    }
    else {
        flipImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BOX1.png"]];
        imageIndex = 0;
    }
    //flipImage.image = nil;
    flipImage.frame = CGRectMake(self.mInitialImageView.frame.origin.x,
                                 self.mInitialImageView.frame.origin.y,
                                 self.mInitialImageView.frame.size.width,
                                 self.mInitialImageView.frame.size.height);
    
    [UIView transitionWithView:self.mContainerView duration:1.0
                       options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
                           [self.mInitialImageView removeFromSuperview];
                           [self.mContainerView addSubview:flipImage];
                       } completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
