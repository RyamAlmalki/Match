import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:match/pages/homepage.dart';


class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;
  final Color accentColor = HexColor("#1A9CF6");
  final Color primaryColor = HexColor("#20A3FB");

  _SplashScreenState(){
    Timer(const Duration(milliseconds: 2000), (){
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const MyHomePage(title: '',)), (route) => false);
      });
    });

     Timer(
      Duration(milliseconds: 10),(){
        setState(() {
          _isVisible = true; // Now it is showing fade effect and navigating to Login page
        });
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        gradient:  LinearGradient(
          colors: [accentColor, primaryColor],
          begin: const FractionalOffset(1, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: const [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: const Duration(milliseconds: 1200),
        child: Center(
          child: Container(
            height: 500.0,
            width: 500.0,
            child: Center(
              child: ClipOval(
                child: Stack(
                    children: [
                       Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            left: BorderSide(
                              color: Colors.black,
                              width: 8.0,
                            ),
                            right: BorderSide(
                              color: Colors.black,
                              width: 8.0,
                            ),
                            top: BorderSide(
                              color: Colors.black,
                              width: 8.0,
                            ),
                            bottom: BorderSide(
                              color: Colors.black,
                              width: 8.0,
                            ),
                          ),
                        ),
                      
                        margin: const EdgeInsets.only(left: 0.0 ),
                        width: 200.0,
                        height: 200.0,
                        child: Stack(
                            children: [
                              Center(
                                child:  Container( 
                                height:50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                    borderRadius: BorderRadius.circular(100) 
                                    )
                                  )
                              )
                            ]
                          ),
                      ),

                        Container(
                          decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            left: BorderSide(
                              color: Colors.black,
                              width: 8.0,
                            ),
                            right: BorderSide(
                              color: Colors.black,
                              width: 8.0,
                            ),
                            top: BorderSide(
                              color: Colors.black,
                              width: 8.0,
                            ),
                            bottom: BorderSide(
                              color: Colors.black,
                              width: 8.0,
                            ),
                          ),
                        ),
                          margin: const EdgeInsets.only(left: 100.0, top: 88.0),
                          width: 200.0,
                          height: 200.0,
                          child: Stack(
                            children: [
                              Center(
                                child:  Container( 
                                height:50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                    borderRadius: BorderRadius.circular(100) 
                                    //more than 50% of width makes circle
                                    )
                                  )
                              )
                            ]
                          ),
                        ),
                    ],
                  ),
                        
                       
              ),
            ),
          ),
        ),
      ),
    );
  }
}