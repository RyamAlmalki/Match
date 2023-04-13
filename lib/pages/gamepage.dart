
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:match/pages/homepage.dart';
import 'package:match/widget/background.dart';
import 'package:google_fonts/google_fonts.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key, required this.title});
  final String title;
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> with TickerProviderStateMixin {

  int rightDice = 3;
  int leftDice = 5;
  int score = 0;
  String state = "";
  late AnimationController controller;
  static int maxScore = 0;
  bool clicked = false;

  @override
  void initState() {
    // start / stop our animation 
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {
          if(controller.value > 0.99){
            if(score >= maxScore){
                maxScore = score;
              }
              controller.stop();
              scoreBored();
            }
        });
      });

    controller.repeat(reverse: false);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void scoreBored(){
    showDialog(context: context,
      barrierDismissible: false,
      builder: (BuildContext cxt) {
      return AlertDialog( // <-- SEE HERE
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Center(
                child: Column(children: [
                   Text('GAME OVER', style: GoogleFonts.fredokaOne(fontSize: 30, color: Colors.white, backgroundColor: Colors.blue),),
                    const SizedBox(height: 15.0),
                    Text('Best!', style: GoogleFonts.fredokaOne(fontSize: 25),),
                    Text('$maxScore', style: GoogleFonts.fredokaOne(fontSize: 25),),
                    const SizedBox(height: 10.0),
                    Text('Score', style: GoogleFonts.fredokaOne(fontSize: 25),),
                    Text('$score', style: GoogleFonts.fredokaOne(fontSize: 25),),
                  ],
                ),
              )
            ],
          ),
        ),
        actions: <Widget>[ 
          Center(
            child: Row(
              children: [
                TextButton(
                    child: Text('Home', style: GoogleFonts.fredokaOne(fontSize: 20),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyHomePage(title: '',)),
                      );
                    },
                  ),
                  const SizedBox(width: 110.0),

                  TextButton(
                    child: Text('Play Again', style: GoogleFonts.fredokaOne(fontSize: 20),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const GamePage(title: '',)),
                      );
                    },
                ),
              ],
            ),
          )
          
          ],
        );
      }
    );

  }

  void changeDices() {
    setState(() {
      rightDice = Random().nextInt(6) + 1;
      leftDice = Random().nextInt(6) + 1;

    });
  }

  void equal() {
    if (rightDice == leftDice) {
      setState(() {
        score++;
      });
    } else {
      setState(() {
        if(score >= maxScore){
          maxScore = score;
        }
        
        scoreBored();
        controller.stop();
      });
    }
    changeDices();
  }

  void notEqual() {
    if (rightDice != leftDice) {
      setState(() {
        score++;
      });
    } else {
      setState(() {
        if(score >= maxScore){
          maxScore = score;
        }


        controller.stop();
        scoreBored();
      });
    }
    changeDices();
  }

  


  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
     return GestureDetector(
      onTap: changeDices,
      child: Scaffold(
        body: Stack(
          children: [
            const Background(title: 'ruam'),
            Positioned(
              top: 120,
              left: 10,
              child: Center(
                child: Column(
                  children: [
                      
                      Container(
                      width: 200,
                      height: 10,
                      child: LinearProgressIndicator(
                          minHeight: 10,
                          value: controller.value,
                          color: Colors.greenAccent, //<-- SEE HERE
                          backgroundColor: Colors.grey, //<-- SEE HERE
                          ),
                    ),


                         
                        
                          
                      
                

                    const SizedBox(height: 20.0),
                    
                    Text("$score", style: GoogleFonts.fredokaOne(fontSize: 96, color: Colors.white),),
                    const SizedBox(height: 30.0),

                    Image.asset("assets/Dice$rightDice.png"),
                    
                    
                    const SizedBox(height: 10.0),
                    Image.asset("assets/Dice$leftDice.png"),
                    

                  const SizedBox(height: 100.0),
                  
                  Row(children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(width: 200, height: 50),
                        child: ElevatedButton(
                          
                          child: Text('YES', style: GoogleFonts.fredokaOne(fontSize: 30),),
                          onPressed: () {
                            if(controller.value < 0.99){
                            controller.reset();
                            controller.forward();
                            equal();
                          } },
                        ),
                      ),

                      const SizedBox(width: 10.0),

                      ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(width: 200, height: 50),
                        child: ElevatedButton(
                          
                          child: Text('NO', style: GoogleFonts.fredokaOne(fontSize: 30),),
                          onPressed: () {
                          if(controller.value < 0.99){
                            controller.reset();
                            controller.forward();
                            notEqual();
                          }
                          },
                        ),
                      ),
                  ],),
                  
                  const SizedBox(height: 12.0),
                  Text("Are they a match?", style: GoogleFonts.fredokaOne(fontSize: 18, color: Colors.white),),

                    
                
                
                  ],
                )
              )
            )
          ]
        ),
      )
     );
  }
}


