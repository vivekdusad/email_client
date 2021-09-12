import 'dart:async';

import 'package:email_client/service/user_service.dart';
import 'package:email_client/user.dart';
import 'package:rxdart/rxdart.dart';

List<String> CONTACT = ["User 1", "User 2", "User 3", "User 4"];

class ContactManager {
  Stream<List<User>> getUsers() async* {
    yield await UserService().browse();
  }

  StreamController<int> _controller = BehaviorSubject<int>();
  Stream<int> get counterStream => _controller.stream;

  ContactManager() {
    getUsers().listen((event) {
      _controller.add(event.length);
    });
  }
}
