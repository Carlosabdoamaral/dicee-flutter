import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int leftSide = 5;
  int rightSide = 2;

  void randomizeDice(int side) {
    // 0 = esquerda
    // 1 = direita

    setState(() {
      if (side == 0) {
        leftSide = Random().nextInt(6) + 1;
      } else {
        rightSide = Random().nextInt(6) + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.amber, Colors.orange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        width: double.infinity,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Text(
                      "Dicee",
                      style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'Montserrat Regular',
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Container(
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        // flex: 2, // Vai ocupar o dobro comparado com a outra Expanded
                        // child: Image(
                        //   image: AssetImage("images/dice1.png"),
                        // ),
                        child: FlatButton(
                          onPressed: (){  randomizeDice(0); },
                          child: Image.asset('images/dice$leftSide.png'),
                        ),
                      ),

                      Expanded(
                        // flex: 2, // Vai ocupar o dobro comparado com a outra Expanded
                        // child: Image(
                        //   image: AssetImage("images/dice1.png"),
                        // ),
                        child: FlatButton(
                          onPressed: () { randomizeDice(1); },
                          child: Image.asset('images/dice$rightSide.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
