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
    _filterSubject.debounceTime(Duration(seconds: 1)).switchMap((filter) async*{
      yield await UserService.browse(filter: filter);
    }).listen((users) async { 
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
