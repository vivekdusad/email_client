import 'package:email_client/helper/search_delegate.dart';
import 'package:email_client/managers/contactManager.dart';
import 'package:email_client/views/widgets/contactStream.dart';
import 'package:email_client/views/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactsScreen extends StatelessWidget {
  ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContactManager contactManager = Provider.of<ContactManager>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Contacts"),
          actions: [
            Chip(
              label: StreamBuilder<int>(
                  stream: contactManager.counterStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active ||
                        snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data.toString(),
                          style: TextStyle(color: Colors.white),
                        );
                      }
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
              backgroundColor: Colors.red,
            ),
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: ContactSearchDelegate());
                },
                icon: Icon(Icons.search))
          ],
        ),
        drawer: DrawerWidget(),
        body: ContactStreamWidget(
          stream: contactManager.getUsers(),
        ));
  }
}
