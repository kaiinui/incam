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
@property (weak, nonatomic) IBOutlet KIIncam *incam;

@end

@implementation KIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.incam startWithDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

# pragma mark - KIIncamDelegate

- (void)incamView:(UIView *)incamView captureOutput:(UIImage *)photo {
    [self.imageView setImage:photo];
}

@end
