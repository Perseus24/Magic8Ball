import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Ask Me Anything', style: TextStyle(
            color: Colors.white
          ),)),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.blue,
        body: MainPage(),
      ),
    )
  );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int ballNum =  1;
  bool secondOpinion = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: (){
                  setState(() {
                    ballNum = Random().nextInt(5)+1;
                  });
                },
                child: Image.asset('images/ball$ballNum.png')
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor:Colors.black38,
                foregroundColor: Colors.blue,
              ),
              onPressed: (){
                setState(() {
                  secondOpinion = true;
                  Duration duration = Duration(milliseconds: 1800);
                  Future.delayed(duration, (delay));
                });
              },
              child: Text(
                  "Do you want a second opinion?",
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ),
          ],
        ),
        Positioned.fill(
            child: secondOpinion? secondOp(context): Container())
      ],
    );
  }

  void delay(){
    setState(() {
      secondOpinion = false;
    });
  }

  Widget secondOp(BuildContext context){
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/second-opinion.png'),
          SizedBox(height: 10,),
          Text(
              "Respect the Magic 8 Ball!\n No second opinion for you!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      )

    );
  }
}
