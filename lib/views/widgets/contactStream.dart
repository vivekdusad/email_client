import 'package:email_client/user.dart';
import 'package:flutter/material.dart';

class ContactStreamWidget extends StatelessWidget {
  final Stream<List<User>>? stream;
  const ContactStreamWidget({Key? key, this.stream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<User>>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active ||
            snapshot.connectionState == ConnectionState.done) {
          final users = snapshot.data;
          return ListView.separated(
              separatorBuilder: (_, __) => Divider(),
              itemCount: users!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(users[index].name![0]),
                  ),
                  title: Text(
                    users[index].name.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  subtitle: Text(users[index].email.toString()),
                );
              });
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
