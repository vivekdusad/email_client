import 'dart:async';

import 'package:email_client/service/user_service.dart';
import 'package:email_client/user.dart';
import 'package:rxdart/rxdart.dart';

class ContactManager {
  final BehaviorSubject<int> _controllerSubject = BehaviorSubject<int>();
  final PublishSubject<String> _filterSubject = PublishSubject<String>();
  final PublishSubject<List<User>> _collectionSubject = PublishSubject();

  Sink<String> get inFilter => _filterSubject.sink;

  Stream<List<User>> get browse$ => _collectionSubject.stream;
  Stream<int> get count$ => _controllerSubject.stream;

  ContactManager() {
    print("called");

    _filterSubject.debounceTime(Duration(seconds: 1)).listen((filter) async {
      var users = await UserService.browse(filter: filter);
      print(users.length);
      _collectionSubject.add(users);
    });
    _collectionSubject.listen((event) {
      _controllerSubject.add(event.length);
    });
  }

  void dispose() {
    _collectionSubject.close();
    _filterSubject.close();
    _controllerSubject.close();
  }
}
