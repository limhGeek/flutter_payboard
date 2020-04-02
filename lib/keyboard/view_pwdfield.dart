import 'dart:math';

import 'package:flutter/material.dart';

class CustomPwdField extends StatelessWidget {
  String data;

  CustomPwdField(this.data);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PwdField(data),
    );
  }
}

class PwdField extends CustomPainter {
  String data;

  PwdField(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    // 密码长度
    int PWD_LENGTH = 6;

    // 密码画笔
    Paint mPwdPaint;
    Paint mRectPaint;

    // 初始化密码画笔
    mPwdPaint = Paint();
    mPwdPaint..color = Colors.black;
    // 初始化密码框
    mRectPaint = Paint();
    mRectPaint..color = Color(0xff707070);

    RRect r = RRect.fromLTRBR(
        0.0, 0.0, size.width, size.height, Radius.circular(size.height / 12));
    mRectPaint.style = PaintingStyle.stroke;
    canvas.drawRRect(r, mRectPaint);

    var per = size.width / PWD_LENGTH;
    var offsetX = per;
    while (offsetX < size.width) {
      canvas.drawLine(
          Offset(offsetX, 0.0), Offset(offsetX, size.height), mRectPaint);
      offsetX += per;
    }

    var half = per / 2;
    var radio = per / 8;

    mPwdPaint.style = PaintingStyle.fill;
    if (null != data && data.length > 0) {
      for (int i = 0; i < data.length && i < 6; i++) {
        canvas.drawArc(
            Rect.fromLTRB(i * per + half - radio, size.height / 2 - radio,
                i * per + half + radio, size.height / 2 + radio),
            0.0,
            2 * pi,
            true,
            mPwdPaint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
