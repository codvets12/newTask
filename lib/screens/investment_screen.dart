import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project1/common/bottom_navigation.dart';
import 'package:new_project1/model/data_model.dart';
import 'package:new_project1/provider/auth_provider/auth_provider.dart';
import 'package:new_project1/screens/create_account.dart';
import 'package:provider/provider.dart';

class InvestmentScreen extends StatelessWidget {
  const InvestmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false)
                    .signout(context);
              },
              icon: Icon(Icons.arrow_back)),
          //Icon(Icons.arrow_back),
          title: Text("Investment"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateAccount()));
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: Stack(
          children: [
            StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('User').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      return ListTile(
                        title: Text(document["AccountName"]),
                        subtitle: Text(document["Value"]),
                      );
                    }).toList(),
                  );
                }),
            Align(
              alignment: Alignment.bottomCenter,
              child: MyBottombar(context),
            )
          ],
        ));
  }
}
