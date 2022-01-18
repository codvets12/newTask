import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project1/common/bottom_navigation.dart';

class SummaryScreen extends StatelessWidget {
  SummaryScreen({Key? key}) : super(key: key);
  List<String> rates = [''];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Summary"),
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                      border: index == 0
                          ? Border()
                          : Border(
                              top: const BorderSide(
                                  width: 1, color: Colors.black38))),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 70,
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Net Worth",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Total Assets",
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Total Liabilities",
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text("\$1,560,000"),
                                Text("\$660,000"),
                                Text("\$100,000")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: MyBottombar(context),
          )
        ],
      ),
    );
  }
}
