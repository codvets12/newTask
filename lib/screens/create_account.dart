import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project1/screens/investment_detail_screen.dart';

import '../helper.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _InvestmentAccountState();
}

class _InvestmentAccountState extends State<CreateAccount> {
  bool checkedValue = false;
  String? dropdownvalue;
  List<String> items = [
    'Selection 1',
    'Selection 2',
    'Selection 3',
    'Selection 4'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.add)),
        title: Text("Investment"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InvestmentDetail()));
                },
                child: Text(
                  "Create",
                  style: TextStyle(fontSize: 20),
                )),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "LINK ACCOUNT",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Row(
              children: [
                Text(
                  "Add Manually",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  "Account Type",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "(SELECT ONE):",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                DropdownButton<String>(
                  // onChanged: (val) => {dropdownvalue = val!},
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: items.map((itemsname) {
                    return DropdownMenuItem<String>(
                      value: itemsname,
                      child: Text(itemsname),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                  value: dropdownvalue,
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Account Name\n(24 char)",
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
          ),
          SizedBox(
            height: 10,
          ),
          Row(
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16),
            child: Row(
              children: [
                Text(
                  "OPTIONAL FIELDS:",
                  style: TextStyle(
                    shadows: [
                      Shadow(color: Colors.black, offset: Offset(0, -9))
                    ],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.transparent,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black,
                    decorationThickness: 4,
                    decorationStyle: TextDecorationStyle.dashed,
                  ),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Text(
                        "Institution name",
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18),
            child: Row(
              children: [
                Text("Beneficiaries Assigned :"),
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(border: Border.all(width: 1)),

                  // child: Checkbox(
                  //   value: value, onChanged: onChanged),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Notes:(100 chars)"),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      hintText: "Text input"),
                ),
                Text(
                  "Asset last updated time:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  "(Auto populated and uneditable)",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black54),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
