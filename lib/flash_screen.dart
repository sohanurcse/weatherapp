import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/mainpage.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({Key? key}) : super(key: key);

  @override
  _FlashScreenState createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Mainpage())));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF6868),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Weather App",style: TextStyle(fontSize: 44,fontWeight: FontWeight.bold,color: Colors.white),),
            SizedBox(height: 20,),
            CircularProgressIndicator(color: Colors.white,),
          ],
        ),
      ),
    );
  }
}
