

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_manga/config/theme_constants.dart';

class ShqsCommonButton extends StatelessWidget {

  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final String text;
  final Icon? icon;
  final bool isEnable;
  final bool isServiceMode;
  final Size? size;

  ShqsCommonButton({
    Key? key,
    required this.text,
    this.icon,
    this.isEnable = true,
    this.isServiceMode = false,
    this.size,
    required this.onTap,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (size != null) {
      return SizedBox(
        width: size?.width,
        height: size?.height,
        child: _button(context),
      );
    } else {
      return FittedBox(
        child: _button(context),
      );
    }
  }

  Widget _button(BuildContext context) {

    return Material(
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(color: _getBorderColor()),
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: InkWell(
            onTap: isEnable?onTap:null,
            onLongPress: isEnable?onLongPress:null,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _buildButtonContent(context),
              ),
            ),
          ),
        )
    );
  }

  List<Widget> _buildButtonContent(BuildContext context) {

    var list = <Widget>[];

    if (icon != null) {
      list.add(icon!);
    }

    var style = Theme.of(context).textTheme.button;

    list.add(Text(text, style: style));
    return list;
  }

  Color _getBorderColor() {
    if (isServiceMode) {
      return isEnable?service_button_border:service_button_border_disable;
    } else {
      return isEnable?main_button_border:main_button_border_disable;
    }
  }
}
