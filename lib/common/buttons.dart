import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../helper.dart';

class SocialButtons extends StatelessWidget {
  SocialButtons(
      {required this.label,
      required this.icon,
      required this.onPressed,
      required this.bgColor,
      // required this.TextColor,
      Key? key})
      : super(key: key);

  String label;
  final void Function() onPressed;
  Icon icon;
  Color bgColor;
  // Color TextColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
        width: getWidth(context) * 0.9,
        height: getHeight(context) * 0.06,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              primary: bgColor, textStyle: TextStyle(color: Colors.black)),
          onPressed: onPressed,
          label: Text(
            label,
          ),
          icon: icon,
        ),
      ),
    );
  }
}
