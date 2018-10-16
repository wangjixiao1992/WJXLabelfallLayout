# WJXWaterfallLayout
    
## 介绍
    瀑布流

## 版本
    1.0.0
    
## 引用cocopods
    source 'https://github.com/wangjixiao1992/WJXWaterfallLayout.git'
    platform :ios, '8.0'
    
    target 'TargetName' do
    pod 'WJXWaterfallLayout', '~> 1.0.0'
    end

## 演示代码
```swift
   - (WJXLabelfallLayout *)flowlayout
   {
       if (!_flowlayout) {
           _flowlayout = [[WJXLabelfallLayout alloc] init];
           _flowlayout.minimumInteritemSpacing = 0;
           _flowlayout.minimumLineSpacing = 0;
           _flowlayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
           _flowlayout.delegate = self;
      }
      return _flowlayout;
   }
```
## 联系我们
如有疑问请发送邮件.谢谢~
wjx_19920914_msg@126.com



