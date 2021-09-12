import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: SvgPicture.network(
                    "https://avatars.dicebear.com/api/micah/hello.svg"),
              ),
              accountName: Text("Vivek Khandelwal"),
              accountEmail: Text("vivekdusad55@gmail.com")),
          FlatButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.home),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Home"),
                  // Spacer(),
                  // Chip(label: Text("2")),
                ],
              )),
          Divider(),
          FlatButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.drafts),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Drafts"),
                  Spacer(),
                  Chip(
                    label: Text(
                      "10+",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.red[100],
                  )
                ],
              )),
          Divider(),
          FlatButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.archive),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Archive",
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      "5",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.green[100],
                  )
                ],
              )),
          Spacer(),
          FlatButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Settings"),
                  Spacer(),
                  TextButton(onPressed: () {}, child: Text("Logout"))
                ],
              )),
        ],
      ),
    );
  }
}
