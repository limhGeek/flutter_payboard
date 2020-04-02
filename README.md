# flutter_payboard

#### 介绍
自定义支付键盘

![支付键盘](https://raw.githubusercontent.com/limhGeek/flutter_payboard/master/image/keyboard.gif)

#### 安装教程

1.  clone工程
2.  复制工程下的keyboard目录到自己的项目
3.  添加如下代码：

```
import 'keyboard/view_keyboard.dart';
```

```
  void _showKeyboard() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (builder) {
        return CustomKeyboard(
          keyHeight: 46,
          autoBack: false,
          pwdLength: 6,
          onKeyDown: (keyEvent) {
            if (keyEvent.isClose()) {
              Navigator.pop(context);
            }
            debugPrint(keyEvent.key);
          },
          onResult: (data) {
            BotToast.showText(text: "密码：$data");
          },
        );
      },
    );
  }

```

- 注意事项：

1、用showModalBottomSheet打开键盘，isScrollControlled值必须为true,当为false时自生高度被限制，具体看源码，

2、backgroundColor: Colors.transparent,需给showModalBottomSheet设置背景透明

#### CustomKeyboard参数说明

序号|参数|说明
--|:--|--
1 |keyHeight |每个按键的高度，默认48
2 |pwdLength |密码长度，默认为6位数
3 |autoBack |自动返回，如果为true,则输入为pwdLehgth长度后自动触发onResult 返回输入值
4 |onKeyDown |点击每个数字键以及关闭按钮的回调方法，用keyEvent.key接收键值，keyEvent.isClose判断是否触发关闭按钮
5 |onResult  |点击确定或者autoBack为true，输入完成后触发回调，返回输入结果

- 参考项目：
[https://juejin.im/post/5c10ef31e51d452e2c698673](https://juejin.im/post/5c10ef31e51d452e2c698673)
