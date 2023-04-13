import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Background extends StatefulWidget {
  const Background({super.key, required this.title});

  final String title;

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  final Color accentColor = HexColor("#1A9CF6");
  final Color primaryColor = HexColor("#20A3FB");

  @override
  Widget build(BuildContext context) {
     return Container(
      color: primaryColor,
      child: Stack(
        children: [

          Positioned(
              top: 200,
              right: 0,
              child: Container(
              transform: Matrix4.rotationZ(-0.40),
              color: accentColor, 
              width: 555.0,
              height: 100.0,
            ),
          ),

          Positioned(
              top: 500,
              child: Container(
              transform: Matrix4.rotationZ(-0.40),
              color: accentColor, 
              width: 666.0,
              height: 50.0,
            ),
          ),

        Positioned(
              top: 800,
              child: Container(
              transform: Matrix4.rotationZ(-0.40),
              color: accentColor, 
              width: 444.0,
              height: 30.0,
            ),
          )
        
          
          
        ]
      ),
    );
  }
}
