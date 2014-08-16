incam
=====

[iOS] You might not need to open modal to take a picture.

```objc
KIIncamView incam = [[KIIncam alloc] initWithFrame:self.view.frame];
[self.view addSubview:incam];
[incam startWithDelegate:self];
```

And implement delegate.

```objc
- (void)incamView:(UIView *)incamView captureOutput:(UIImage *)photo;
```
