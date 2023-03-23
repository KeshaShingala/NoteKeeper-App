import 'package:flutter/material.dart';
import 'package:notekeeper_app/views/screens/signinpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash_screens extends StatefulWidget {
  const splash_screens({Key? key}) : super(key: key);

  @override
  State<splash_screens> createState() => _splash_screensState();
}

class _splash_screensState extends State<splash_screens> {

  logicIntro() async {
    final prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    logicIntro();
    Future.delayed(
      const Duration(seconds: 3),
          () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const signinpage())),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              height: 900,
              width: 500,
              child: Image.asset("assets/imgaes/3 (2).jpg",fit: BoxFit.fitHeight,)),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: "B",style: TextStyle(color: Color(0xff795C4B),fontSize: 65,fontWeight: FontWeight.w900)),
                TextSpan(text: "O",style: TextStyle(color: Color(0xff795C4B),fontSize: 65,fontWeight: FontWeight.w900)),
                TextSpan(text: "O",style: TextStyle(color: Color(0xffFE9689),fontSize: 65,fontWeight: FontWeight.w900)),
                TextSpan(text: "K",style: TextStyle(color: Color(0xffFE9689),fontSize: 65,fontWeight: FontWeight.w900)),
                TextSpan(text: "I",style: TextStyle(color: Color(0xff795C4B),fontSize: 65,fontWeight: FontWeight.w900)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
