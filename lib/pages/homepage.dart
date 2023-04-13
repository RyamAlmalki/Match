import 'package:flutter/material.dart';
import 'package:match/pages/gamepage.dart';
import 'package:match/widget/background.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Background(title: 'ruam'),
          Positioned(
            top: 120,
            left: 60,
            child: Center(
              child: Column(
                children: [

                  
                  Text('Match', style: GoogleFonts.fredokaOne(fontSize: 96, color: Colors.white),),
                  const SizedBox(height: 100.0),

                  Stack(
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

                  const SizedBox(height: 120.0),
                 
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints.tightFor(width: 300, height: 50),
                      child: ElevatedButton(
                        child: Text('Start', style: GoogleFonts.fredokaOne(fontSize: 30),),
                        onPressed: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const GamePage(title: '',)),
                          );
                        },
                      ),
                    ),
                  )
                
              
                ],
              )
            )
          )
        ]
      ),
    );
  }
}
