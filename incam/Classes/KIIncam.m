#import "KIIncam.h"
#import <AVFoundation/AVFoundation.h>

@interface KIIncam ()

@property AVCaptureSession *session;
@property AVCaptureStillImageOutput *imageOutput;
@property AVCaptureVideoPreviewLayer *previewLayer;
@property (nonatomic, weak) id<KIIncamDelegate> delegate;

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

- (void)startWithDelegate:(id<KIIncamDelegate>)delegate {
    
    self.delegate = delegate;
    [_session startRunning];
}

# pragma mark - Private Methods

- (void)initializeCapture {
    AVCaptureSession *session = [self setupSession];
    if (!session) {return;}
    [self.layer addSublayer:[self setupPreviewLayer]];
    [self setupConnection];
    [self setupUIGestureRecognizer];
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

- (void)setupOutput {
    NSDictionary* settings = @{(id)kCVPixelBufferPixelFormatTypeKey:[NSNumber numberWithInt:kCVPixelFormatType_32BGRA]};
    AVCaptureVideoDataOutput* dataOutput = [[AVCaptureVideoDataOutput alloc] init];
    dataOutput.videoSettings = settings;
    [dataOutput setSampleBufferDelegate:nil queue:dispatch_get_main_queue()];
    self.imageOutput = [[AVCaptureStillImageOutput alloc] init];
    [self.session addOutput:self.imageOutput];
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

- (void)setupUIGestureRecognizer {
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
    [self addGestureRecognizer:recognizer];
    recognizer.delegate = self;
}

- (void)invokeDelegateWithImage:(UIImage *)image {
    [self.delegate incamView:self captureOutput:image];
}

- (void)invokeDelegateWithData:(NSData *)data {
    UIImage *image = [self imageWithData:data];
    [self invokeDelegateWithImage:image];
}

- (UIImage *)imageWithData:(NSData *)data {
    return [UIImage imageWithData:data];
}

- (void)shutterCamera {
    AVCaptureConnection *connection = [[self.imageOutput connections] lastObject];
    [self.imageOutput captureStillImageAsynchronouslyFromConnection:connection
                                                  completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
                                                      NSData *data = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
                                                      [self invokeDelegateWithData:data];
                                                  }];
}

# pragma mark UIGestureRecognizer

- (void)handleTapFrom:(UITapGestureRecognizer *)recognizer {
    NSLog(@"TAPPED!");
}

@end
