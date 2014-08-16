#import <UIKit/UIKit.h>

@protocol KIIncamDelegate <NSObject>

@required

- (void)incamView:(UIView *)incamView captureOutput:(UIImage *)photo;

@end

@interface KIIncam : UIView <UIGestureRecognizerDelegate>

- (id)initWithCoder:(NSCoder *)aDecoder;
- (id)initWithFrame:(CGRect)frame;

- (void)startWithDelegate:(id<KIIncamDelegate>)delegate;

@end
