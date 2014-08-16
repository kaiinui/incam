incam
=====

[iOS] You might not need to open modal to take a picture.

```objc
# Objective-C
KIIncam incam = [[KIIncam alloc] init];
[self.view addSubview:incam];
incam.delegate = self;
[incam start];
```

```swift
# Swift
let incam = KIIncam()
self.view.addSubview(incam)
incam.delegate = self
incam.start()
```
