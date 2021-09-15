import 'package:email_client/helper/observer.dart';
import 'package:email_client/helper/search_delegate.dart';
import 'package:email_client/managers/contactManager.dart';
import 'package:email_client/overseer.dart';
import 'package:email_client/views/widgets/contactStream.dart';
import 'package:email_client/views/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactsScreen extends StatelessWidget {
  ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContactManager contactManager =
        Provider.of<OverSeer>(context).fetch(ContactManager);
    contactManager.inFilter.add('');
    return Scaffold(
        appBar: AppBar(
          title: Text("Contacts"),
          actions: [
            Chip(
              label: Observer<int>(
                stream: contactManager.count$,
                onSuccess: (context, data) {
                  return Text(
                    data.toString(),
                    style: TextStyle(color: Colors.white),
                  );
                },
              ),
              backgroundColor: Colors.red,
            ),
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: ContactSearchDelegate());
                },
                icon: Icon(Icons.search))
          ],
        ),
        drawer: DrawerWidget(),
        body: ContactStreamWidget(
          stream: contactManager.browse$,
        ));
  }
}
