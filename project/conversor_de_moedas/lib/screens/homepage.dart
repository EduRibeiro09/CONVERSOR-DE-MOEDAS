import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png",scale:3 ,),
            Text("CONVER\$SIMPLES",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32),),
          ],
        ),
        centerTitle: true,
      ) ,

    );
  }
}