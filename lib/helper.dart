import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color facebookColor = Color(0xff39579A);
const Color googleColor = Color(0xffDF4A32);
const Color phoneColor = Colors.white;

// const Color twitterColor = const Color(0xff00ABEA);
// const Color instaColor = const Color(0xffBE2289);
// const Color whatsappColor = const Color(0xff075E54);
// const Color linkedinColor = const Color(0xff0085E0);
// const Color githubColor = const Color(0xff202020);

getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

getBigText() {
  return const TextStyle(
      fontSize: 35, fontWeight: FontWeight.w500, letterSpacing: 1);
}

getNormalText() {
  return const TextStyle(
      fontSize: 23, fontWeight: FontWeight.w500, letterSpacing: 1);
}

getInputDecoration(String label) {
  return InputDecoration(
    label: Text(label),
  );
}
