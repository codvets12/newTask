import 'package:flutter/cupertino.dart';
import 'package:new_project1/screens/asset_category.dart';
import 'package:new_project1/screens/authentication_screen.dart';
import 'package:new_project1/screens/create_account.dart';
import 'package:new_project1/screens/investment_detail_screen.dart';
import 'package:new_project1/screens/investment_screen.dart';
import 'package:new_project1/screens/landing_screen.dart';

import 'package:new_project1/screens/splash.dart';
import 'package:new_project1/screens/summary_screen.dart';

class Routes {
  static const String landingScreen = '/landingScreen';
  static const String assetcategoryscreen = '/assetcategoryscreen';
  static const String investmentscreen = '/investmentscreen';
  static const String createaccountscreen = '/createaccountscreen';
  static const String investmentdetailscreen = '/investmentdetailscreen';
  static const String summaryscreen = '/summaryscreen';
  static const String authenticationscreen = 'authenticationscreen';

  static Map<String, Widget Function(BuildContext)> getRoutes(
          BuildContext context) =>
      {
        // '/': (context) => SplashScreen(),
        '/': (context) => LandingScreen(),
        authenticationscreen: (context) => AuthenticationScreen(),
        assetcategoryscreen: (context) => AssetCategoryScreen(),
        investmentscreen: (context) => InvestmentScreen(),
        createaccountscreen: (context) => CreateAccount(),
        investmentdetailscreen: (context) => InvestmentDetail(),
        summaryscreen: (context) => SummaryScreen(),
      };
}
