import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

/// Clickable text widget
class ClickableText extends StatelessWidget {
  
  final String? prefix;
  final double prefixTextSize;
  final Color prefixTextColor;
  
  final String clickable;
  final double clickableTextSize;
  final Color clickableTextColor;
  final bool underline;
  
  final String? postfix;
  final double postfixTextSize;
  final Color postfixTextColor;
  
  final VoidCallback? onTap;
  
  ClickableText({
    Key? key,
    this.prefix,
    this.prefixTextSize = 12,
    this.prefixTextColor = Colors.white,
    required this.clickable,
    this.clickableTextSize = 14,
    this.clickableTextColor = Colors.lightBlueAccent,
    this.underline = true,
    this.postfix,
    this.postfixTextSize = 12,
    this.postfixTextColor = Colors.white,
    this.onTap
  }):super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return RichText(
      text: TextSpan(children: _buildTextList()),
    );
  }

  List<TextSpan> _buildTextList() {

    var textList = <TextSpan>[];

    if (prefix != null) {
      textList.add(TextSpan(
        style: TextStyle(color: prefixTextColor, fontSize: prefixTextSize),
        text: prefix,
      ));
    }

    textList.add(TextSpan(
      style: TextStyle(
        color: clickableTextColor,
        fontSize: clickableTextSize,
        decoration: (underline)?TextDecoration.underline:null
      ),
      text: clickable,
      recognizer: TapGestureRecognizer()
        ..onTap = onTap
    ));

    if (postfix != null) {
      textList.add(TextSpan(
        style: TextStyle(color: postfixTextColor, fontSize: postfixTextSize),
        text: postfix,
      ));
    }

    return textList;
  }
}