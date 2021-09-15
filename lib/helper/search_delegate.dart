import 'package:email_client/managers/contactManager.dart';
import 'package:email_client/overseer.dart';
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
    _contactManger = Provider.of<OverSeer>(context).fetch(ContactManager);

    if (query.length < 3) {
      return Container();
    }
    _contactManger!.inFilter.add(query);
    return ContactStreamWidget(
      stream: _contactManger!.browse$,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _contactManger = Provider.of<OverSeer>(context).fetch(ContactManager);
    if (query.length < 3) {
      return Container();
    }
    _contactManger!.inFilter.add(query);
    return ContactStreamWidget(
      stream: _contactManger!.browse$,
    );
  }
}
