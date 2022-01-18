import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_project1/provider/auth_provider/auth_provider.dart';
import 'package:new_project1/routes/routes.dart';
import 'package:new_project1/screens/asset_category.dart';
import 'package:new_project1/screens/landing_screen.dart';
import 'package:new_project1/screens/authentication_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(providers: [
    Provider(create: (context) => AuthProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: Routes.getRoutes(context),
    );
  }
}
