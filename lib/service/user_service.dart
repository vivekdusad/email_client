import 'dart:convert';

import 'package:email_client/user.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class UserService {
  Future<List<User>> browse() async {
    String url = "https://jsonplaceholder.typicode.com/users";
    Response respone = await http.get(Uri.parse(url));
    List list = jsonDecode(respone.body);
    return list.map((e) => User.fromJson(e)).toList();
  }
}
