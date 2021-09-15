import 'package:email_client/helper/observer.dart';
import 'package:email_client/user.dart';
import 'package:flutter/material.dart';

class ContactStreamWidget extends StatelessWidget {
  final Stream<List<User>>? stream;
  const ContactStreamWidget({Key? key, this.stream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer<List<User>>(
      
      stream: stream,
      onSuccess: (context, users) => ListView.separated(
          separatorBuilder: (_, __) => Divider(),
          itemCount: users!.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              trailing: null,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.call,
                          color: Colors.green,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.message,
                          color: Colors.blue,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.video_call,
                          color: Colors.green,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                )
              ],
              leading: CircleAvatar(
                child: Text(users[index].name![0]),
              ),
              title: Text(
                users[index].name.toString(),
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              subtitle: Text(users[index].email.toString()),
            );
          }),
    );
  }
}
