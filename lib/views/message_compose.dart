import 'package:email_client/managers/usermanager.dart';
import 'package:email_client/overseer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageCompose extends StatelessWidget {
  const MessageCompose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MessageComposeManager messageComposeManager =
        Provider.of<OverSeer>(context).fetch(MessageComposeManager);
    return Scaffold(
      appBar: AppBar(
        title: Text("Compose Message"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<String>(
                stream: messageComposeManager.email$,
                builder: (context, snapshot) {
                  return ListTile(
                    title: TextField(
                      onChanged: messageComposeManager.inEmail.add,
                      decoration: InputDecoration(
                          labelText: "To",
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null),
                    ),
                  );
                }),
            StreamBuilder<String>(
                stream: messageComposeManager.subject$,
                builder: (context, snapshot) {
                  return ListTile(
                    title: TextField(
                      onChanged: messageComposeManager.inSubject.add,
                      decoration: InputDecoration(
                          labelText: "SUBJECT",
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null),
                    ),
                  );
                }),
            StreamBuilder<String>(
                stream: messageComposeManager.body$,
                builder: (context, snapshot) {
                  return ListTile(
                    title: TextField(
                      onChanged: messageComposeManager.inBody.add,
                      decoration: InputDecoration(
                        labelText: "Body",
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 100.0),
                      ),
                    ),
                  );
                }),
            StreamBuilder<bool>(
                stream: messageComposeManager.isFormValid$,
                builder: (context, snapshot) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      color: Colors.green,
                      onPressed: () {
                        if (snapshot.hasData) {
                          messageComposeManager.submit(context);
                          Navigator.pop(context);
                        }
                      },
                      child: Text("Save"),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
