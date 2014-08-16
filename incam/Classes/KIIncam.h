#import <UIKit/UIKit.h>

@protocol KIIncamDelegate <NSObject>

- (void)incamView:(UIView *)incamView captureOutput:(UIImage *)photo;

@end

@interface KIIncam : UIView

- (id)initWithCoder:(NSCoder *)aDecoder;
- (id)initWithFrame:(CGRect)frame;

- (void)startWithDelegate;

@end
