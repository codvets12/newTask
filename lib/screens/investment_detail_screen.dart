import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project1/common/bottom_navigation.dart';
import 'package:new_project1/screens/summary_screen.dart';

class InvestmentDetail extends StatelessWidget {
  const InvestmentDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> name = [
      "401k_Name                      \$100.00\n401k ",
      "Account Name\nAccount Type",
      "Account 2\nAccount Type",
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("Investment"),
        actions: [Icon(Icons.add)],
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: name.length,
              itemBuilder: (BuildContext context, int index) => Container(
                    decoration: BoxDecoration(
                        border: index == 0
                            ? Border()
                            : Border(
                                top: BorderSide(
                                    width: 1, color: Colors.black38))),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SummaryScreen())),
                      child: Container(
                          height: 50,
                          width: 80,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "401k_Name",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "\$100.00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(Icons.arrow_forward_ios_outlined)
                                    //Text(name[index]),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ),
                  )),
          Align(
            alignment: Alignment.bottomCenter,
            child: MyBottombar(context),
          )
        ],
      ),
    );
  }
}
