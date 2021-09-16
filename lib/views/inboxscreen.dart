import 'package:email_client/views/message_compose.dart';
import 'package:flutter/material.dart';
import 'widgets/drawer.dart';
import 'home.dart';
import 'others.dart';

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Icon(Icons.all_inbox),
                ),
                Tab(
                  child: Icon(
                    Icons.inbox_rounded,
                  ),
                )
              ],
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.restart_alt))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MessageCompose()));
            },
          ),
          drawer: DrawerWidget(),
          body: TabBarView(children: [HomePage(), OthersPage()])),
    );
  }
}
