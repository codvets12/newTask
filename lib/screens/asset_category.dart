import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project1/common/bottom_navigation.dart';
import 'package:new_project1/screens/investment_screen.dart';

class AssetCategoryScreen extends StatelessWidget {
  const AssetCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> name = [
      "investment",
      "retirement",
      "insurance",
      "banking",
      "other assets",
      "liabialties"
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Asset Category"),
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: name.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InvestmentScreen())),
                    child: Column(
                      children: [
                        ListTile(
                          trailing: Icon(Icons.arrow_forward_ios_outlined),
                          title: Text(name[index]),
                        ),
                        Divider(),
                      ],
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
