import 'package:flutter/material.dart';

class CalanderScreen extends StatelessWidget {
  const CalanderScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text("Calander")),
      ),
    );
  }
}