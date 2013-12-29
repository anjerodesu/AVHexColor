AVHexColor
===============================
[![Build Status](https://travis-ci.org/anjerodesu/AVHexColor.png?branch=master)](https://travis-ci.org/anjerodesu/AVHexColor)
![Badge w/ Version](https://cocoapod-badges.herokuapp.com/v/HexColors/1.1.0/badge.png)  
![ios/osx](https://cocoapod-badges.herokuapp.com/p/HexColors/badge.png)

`AVHexColor` was inspired by the lack of hexadecimal colour integration of iOS.

Methods
-------------------------------
+ + (AVColor *)colorWithHex:(UInt32)hexadecimal;
+ + (AVColor *)colorWithHexString:(NSString *)hexadecimal;

And a lot of convenience methods...

Install
-------------------------------
### Recommended

#### Podfile

via [CocoaPods](http://cocoapods.org)

```ruby
platform :ios
pod 'AVHexColor', '~> 1.1.0'
```

### Alternatives

1. Using git subtree
	- `git subtree add --prefix=AVHexColor --squash https://github.com/anjerodesu/AVHexColor.git master`
2. Using git submodule
	- `git submodule add https://github.com/anjerodesu/AVHexColor.git AVHexColor`
3. [Download](https://github.com/anjerodesu/AVHexColor/archive/master.zip "Download Zip")
	- Copy the `AVHexColor.h` and `AVHexColor.m` files and `#import` the *header file* (`AVHexColor.h`) to your project

License
-------------------------------
ColorWithHex is available under the MIT license. See the [LICENSE](https://github.com/anjerodesu/AVColorWithHex/blob/master/LICENCE "License File") file for more info.
