import 'package:email_client/managers/counterManger.dart';
import 'package:email_client/overseer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalanderScreen extends StatelessWidget {
  const CalanderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterManger counterManger =
        Provider.of<OverSeer>(context).fetch(CounterManger);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                counterManger.increment();
              },
              icon: Icon(Icons.add)),
          IconButton(
              onPressed: () {
                counterManger.decremnt();
              },
              icon: Icon(Icons.delete)),
        ],
      ),
      body: Container(
        child: Center(
            child: StreamBuilder<Object>(
                stream: counterManger.counter$,
                builder: (context, snapshot) {
                  return Text(snapshot.data.toString());
                })),
      ),
    );
  }
}
