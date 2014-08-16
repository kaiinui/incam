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

Installation
---

`pod 'KIIncam'`

LICENSE
---

The MIT License (MIT)

Copyright (c) 2014 kaiinui

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
