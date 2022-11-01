# SegmentedControl

SegmentedControl 스위프트 패키지 입니다.

## Overview

### Requirements

- macOS Ventura 13.0
- Xcode 14.0.1
- iOS 13.0

### Installation

#### Swift Package Manager

```swift
.package(url: "https://github.com/jaemyeong/SegmentedControl.git", .upToNextMajor(from: "0.1.0"))
```

### Usage

```swift
import SegmentedControl

let segmentedControl = SegmentedControl()
segmentedControl.addTarget(self, action: #selector(Self.segmentedControlChanged(_:)), for: .valueChanged)
```

### Documentation

- [SDSMealAPI](https://segmented-control.jaemyeong.com/docs/documentation/segmentedcontrol/)

### License

- MIT

### Author

[Jaemyeong Jin](https://github.com/jaemyeong) ([jaemyeong@me.com](mailto:jaemyeong@me.com))
