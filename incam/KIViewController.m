//
//  KIViewController.m
//  incam
//
//  Created by kaiinui on 2014/08/16.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KIViewController.h"
#import "KIIncam.h"

@interface KIViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation KIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    KIIncam *incam = [[KIIncam alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [incam startWithDelegate:self];
    [self.view addSubview:incam];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - KIIncamDelegate

- (void)incamView:(UIView *)incamView captureOutput:(UIImage *)photo {
    [self.imageView setImage:photo];
}

@end
