import 'package:flutter/material.dart';
import 'package:new_project1/Routes/routes.dart';
import 'package:new_project1/common/buttons.dart';
import 'package:new_project1/provider/auth_provider/auth_provider.dart';
import 'package:new_project1/screens/asset_category.dart';
import 'package:new_project1/screens/investment_screen.dart';
import 'package:new_project1/widgets/auth_widget/login.dart';
import 'package:provider/provider.dart';

import '../../helper.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isobsecure = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formGlobalkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            width: getWidth(context),
            height: getHeight(context),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    height: 8,
                  ),
                  Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: GestureDetector(
                        onTap: () {},
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
                              "Login in with facebook",
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
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: isobsecure,
                            decoration: InputDecoration(
                                prefix: Icon(Icons.lock),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.5)),
                                contentPadding: EdgeInsets.all(8),
                                hintText: 'Password'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.5)),
                                contentPadding: EdgeInsets.all(8),
                                hintText: 'Name'),
                          ),
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 15),
                                child: Text(
                                  "By signing up you agree to our terms of services and privacy policy",
                                  style: TextStyle(color: Colors.blue),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: SizedBox(
                                height: getHeight(context) * 0.06,
                                width: getWidth(context) * 0.9,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await Provider.of<AuthProvider>(context,
                                            listen: false)
                                        .register(context,
                                            password: passwordController.text,
                                            email: emailController.text);
                                  },
                                  child: Text("Sign Up"),
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
