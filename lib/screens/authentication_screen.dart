import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:new_project1/widgets/auth_widget/login.dart';
import 'package:new_project1/widgets/auth_widget/sign_up.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _CustomTabState();
}

class _CustomTabState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
            bottom: TabBar(
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  child: Text(
                    "Log in",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Sign up",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            title: Text(
              'DAMMY APP',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Center(
            child: TabBarView(
              children: [LoginScreen(), SignupScreen()],
            ),
          )),
    );
  }
}
