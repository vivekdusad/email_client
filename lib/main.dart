import 'package:email_client/managers/contactManager.dart';
import 'package:email_client/views/calanderscreen.dart';
import 'package:email_client/views/contactscreen.dart';
import 'package:email_client/views/inboxscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Provider<ContactManager>(
      create:(context)=> ContactManager(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.indigo, accentColor: Colors.red),
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), label: "Contacts"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.schedule), label: "Calander")
            ],
          ),
          body: [
            InboxScreen(),
            ContactsScreen(),
            CalanderScreen(),
          ].elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
