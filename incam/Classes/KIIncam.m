#import "KIIncam.h"
#import <AVFoundation/AVFoundation.h>

@interface KIIncam ()

@property AVCaptureSession *session;
@property AVCaptureVideoPreviewLayer *previewLayer;

@end

@implementation KIIncam

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initializeCapture];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeCapture];
    }
    return self;
}

- (void)startWithDelegate {
    [_session startRunning];
}

# pragma mark - Private Methods

- (void)initializeCapture {
    AVCaptureSession *session = [self setupSession];
    if (!session) {return;}
    [self.layer addSublayer:[self setupPreviewLayer]];
    [self setupConnection];
}

- (AVCaptureSession *)setupSession {
    AVCaptureDeviceInput *input = [self setupInput];
    if (!input) {
        return nil;
    }
    
    _session = [AVCaptureSession new];
    [_session addInput:input];
    return _session;
}

- (AVCaptureDeviceInput *)setupInput {
    NSError *error;
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    return [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
}

- (AVCaptureVideoPreviewLayer *)setupPreviewLayer {
    _previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_session];
    [_previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [_previewLayer setFrame:self.bounds];
    return _previewLayer;
}

- (AVCaptureConnection *)setupConnection {
    AVCaptureConnection *connection = _previewLayer.connection;
    connection.videoOrientation = AVCaptureVideoOrientationPortrait;
    return connection;
}

@end
