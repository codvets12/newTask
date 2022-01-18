import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  Field({
    required this.text,
    Key? key,
  }) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Account Value",
                ),
              ),
              Text(
                ":",
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: TextField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1)),
                contentPadding: EdgeInsets.all(8)),
          ),
        )
      ],
    );
  }
}
