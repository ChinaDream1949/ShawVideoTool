# ShawVideoTool

[![CI Status](https://img.shields.io/travis/14202183qq.com/ShawVideoTool.svg?style=flat)](https://travis-ci.org/14202183qq.com/ShawVideoTool)
[![Version](https://img.shields.io/cocoapods/v/ShawVideoTool.svg?style=flat)](https://cocoapods.org/pods/ShawVideoTool)
[![License](https://img.shields.io/cocoapods/l/ShawVideoTool.svg?style=flat)](https://cocoapods.org/pods/ShawVideoTool)
[![Platform](https://img.shields.io/cocoapods/p/ShawVideoTool.svg?style=flat)](https://cocoapods.org/pods/ShawVideoTool)

## 用法
// 第一种：自动压缩，分low ,medium , high 三档
[_videoBox appendVideoByPath:_videoPath];
_videoBox.ratio = WAVideoExportRatioLowQuality;//有损压缩
[_videoBox asyncFinishEditByFilePath:filePath complete:^(NSError *error) {
    // do it
}];

// 第二种：通过自行设定分辩率，实现高清压缩
[_videoBox appendVideoByPath:_videoPath];
_videoBox.ratio = WAVideoExportRatio640x480;
    // _videoBox.vidoQuality = 6;还可以通过设置videoQuality进行精准压缩
[_videoBox asyncFinishEditByFilePath:filePath complete:^(NSError *error) {
    // do it
}];

[_videoBox appendVideoByPath:_testThreePath];
[_videoBox appendVideoByPath:_testTwoPath];
[_videoBox asyncFinishEditByFilePath:filePath progress:^(float progress) {
    // do it 长时间的操作可以添加进度监控
}  complete:^(NSError * error) {
    // do it 
}];

[_videoBox appendVideoByPath:_videoPath];
[_videoBox dubbedSoundBySoundPath:_testThreePath];
[_videoBox asyncFinishEditByFilePath:filePath complete:^(NSError *error) {
    // do it 
}];
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ShawVideoTool is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ShawVideoTool'
```

## Author

14202183qq.com, 1420218361@qq.com

## License

ShawVideoTool is available under the MIT license. See the LICENSE file for more info.
