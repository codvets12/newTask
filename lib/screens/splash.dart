import 'package:flutter/material.dart';
import 'package:new_project1/provider/auth_provider/auth_provider.dart';
import 'package:provider/src/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Provider.of(context, listen: false).splashInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Wings",
              style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 55.0),
              child: CircularProgressIndicator(
                color: Colors.purple,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
    );
  }
}
