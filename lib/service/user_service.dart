import 'dart:convert';

import 'package:email_client/user.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class UserService {
  static Future<List<User>> browse({String? filter}) async {
    String url = "https://5b56-103-157-168-33.ngrok.io/contacts?name=$filter";
    print(url);
    Response respone = await http.get(Uri.parse(url));
    List list = jsonDecode(respone.body);
    List<User> users = list.map((e) => User.fromJson(e)).toList();

    print(users.length);
    return users;
  }
}
