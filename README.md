incam
=====

Inspired by Facebook Messenger's inline camera. **People might not need to open modal to take a picture.**

![](https://raw.githubusercontent.com/kaiinui/incam/master/KIIncamSS.gif)

```objc
KIIncam incam = [[KIIncam alloc] initWithFrame:self.view.frame];
[self.view addSubview:incam];
[incam startWithDelegate:self];
```

or put it in Storyboard and

```objc
[self.incamView startWithDelegate:self];
```

And implement delegate method.

```objc
# <KIIncamDelegate>

- (void)incamView:(UIView *)incamView captureOutput:(UIImage *)photo;
```
