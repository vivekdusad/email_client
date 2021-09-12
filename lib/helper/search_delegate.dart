import 'package:email_client/managers/contactManager.dart';
import 'package:email_client/user.dart';
import 'package:email_client/views/widgets/contactStream.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactSearchDelegate extends SearchDelegate {
  ContactManager? _contactManger;
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = "";
            }
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return Icon(Icons.search);
  }

  @override
  Widget buildResults(BuildContext context) {
    _contactManger = Provider.of<ContactManager>(context);
    if (query.length < 3) {
      return Container();
    }
    return ContactStreamWidget(
      stream: _contactManger!.getUsers(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _contactManger = Provider.of<ContactManager>(context);
    if (query.length < 3) {
      return Container();
    }
    return ContactStreamWidget(
      stream: _contactManger!.getUsers(),
    );
  }
}
