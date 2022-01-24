import 'dart:math';

import 'package:flutter/material.dart';
import 'package:new_project1/Routes/routes.dart';
import 'package:new_project1/common/buttons.dart';
import 'package:new_project1/provider/auth_provider/auth_provider.dart';
import 'package:new_project1/screens/asset_category.dart';
import 'package:new_project1/screens/investment_screen.dart';
import 'package:provider/provider.dart';

import '../../helper.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  TextEditingController passwordController = TextEditingController();

  final formGlobalkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            width: getWidth(context),
            height: getHeight(context),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InvestmentScreen()));
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Icon(Icons.facebook),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Login in with facebook",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: GestureDetector(
                        onTap: () {
                          Provider.of<AuthProvider>(context, listen: false)
                              .loginWithGoogle();
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Image(
                                image: AssetImage(
                                    "assets/images/chrome_icon.png")),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Login in with google",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                  ),
                  Form(
                    key: formGlobalkey,
                    child: Column(
                      children: [
                        Text(
                          "or",
                          style: getNormalText(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 0.5)),
                                  hintText: 'Email Address',
                                  contentPadding: EdgeInsets.all(8)),
                              validator: (val) {
                                if (!emailRegex.hasMatch(val!)) {
                                  return "invalid email";
                                }
                                return null;
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                                prefix: Icon(Icons.lock),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.5)),
                                contentPadding: EdgeInsets.all(8),
                                hintText: 'Password'),
                            validator: (val) {
                              if (val!.length < 6) {
                                return "password is short";
                              }
                              return null;
                            },
                          ),
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Don't remember your password",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: SizedBox(
                                height: getHeight(context) * 0.06,
                                width: getWidth(context) * 0.9,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (formGlobalkey.currentState!
                                        .validate()) {
                                      formGlobalkey.currentState!.save();

                                      Provider.of<AuthProvider>(context,
                                              listen: false)
                                          .login(context,
                                              password: passwordController.text,
                                              email: emailController.text);
                                    }
                                  },
                                  child: Text("Login"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

showAlertaDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(),
        SizedBox(
          width: 15,
        ),
        Text("loading")
      ],
    ),
  );
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
