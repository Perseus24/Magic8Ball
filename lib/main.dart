import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Ask Me Anything')),
          backgroundColor: Colors.black38,
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
  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(height: MediaQuery.of(context).size.height*0.1),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor:Colors.black38,
            foregroundColor: Colors.blue,
          ),
          onPressed: (){
          },
          child: Text(
              "Do you want a second opinion?",
            style: TextStyle(
              color: Colors.white,
            ),
          )
        )
      ],
    );
  }
}

