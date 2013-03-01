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
*QBTitleView* is released under the **MIT License**, see *LICENSE.txt*.