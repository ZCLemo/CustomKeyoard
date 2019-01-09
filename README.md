# CustomKeyoard
自定义键盘

#### 1.最近项目中重新做了一套自定义键盘，之前的做法使用xib做的，复用性不高，修改样式麻烦。这次纯代码编写，做到了新增键盘按钮样式修改键盘按钮样式比较方便。类型包括数字键盘，字母键盘，安全键盘，股票代码搜索键盘，股票数量输入键盘,键盘样式如下图所示。

![number.png](https://upload-images.jianshu.io/upload_images/1930004-d513466b69245e1d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![ascii.png](https://upload-images.jianshu.io/upload_images/1930004-5c3eef0c3ac99fc4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![secure.png](https://upload-images.jianshu.io/upload_images/1930004-1b4360092d6adc82.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![stockInput.png](https://upload-images.jianshu.io/upload_images/1930004-86fc232e2368141d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![stockPosition.png](https://upload-images.jianshu.io/upload_images/1930004-6d9319911d4d2cf3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 2.键盘的样式定义都放在 “EMKeyboardDefine.h” 头文件中，可以根据自己的需要适当的修改来调整。
![屏幕快照 2019-01-09 上午9.27.52.png](https://upload-images.jianshu.io/upload_images/1930004-effd89ee358d3a83.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 3.最主要的还是“EMKeyboardButton”类中对各个按钮样式的定义，可以根据自己的需要增加或则修改。
![屏幕快照 2019-01-09 上午9.33.07.png](https://upload-images.jianshu.io/upload_images/1930004-a9ce100081a6744b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 4.后续创建键盘的时候，一个键盘按钮类型的数组，一个for循环就ok了，按钮的点击事件统一处理，根据不同的键盘按钮类型区分，简单方便。参考“EMNumberKeyboard”。

#### 5.字母键盘比较特殊，所以做法可能有点粗糙，但大致思想还是一样。参考“EMASCIIKeyboard”

#### 6.最后上代码，demo地址:<https://github.com/ZCLemo/CustomKeyoard>
