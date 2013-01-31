# QBTitleView
QBTitleView is an account indicator designed for `titleView` property of UINavigationItem.


## ScreenShot
![ss01.png](http://adotout.sakura.ne.jp/github/QBTitleView/ss01.png)


## Properties
### delegate
The delegate object.

`@property (nonatomic, assign) id<QBTitleViewDelegate> delegate`

### highlighted
A Boolean value that indicates whether the view is highlighted.

`@property (nonatomic, assign) BOOL highlighted`

### title
The string displayed in the label.

`@property (nonatomic, copy) NSString *title`

### image
The image displayed in the image view.

`@property (nonatomic, retain) UIImage *image`

### highlightedImage
The highlighted image displayed in the image view.

`@property (nonatomic, retain) UIImage *highlightedImage`

See `QBTitleView.h` for more customizable properties.


## Example
See *QBTitleView* project for example usage.


## License
 Copyright (c) 2013 Katsuma Tanaka
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
