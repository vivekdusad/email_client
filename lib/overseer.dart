import 'package:email_client/managers/contactManager.dart';
import 'package:email_client/managers/counterManger.dart';

class OverSeer {
  Map<dynamic, dynamic> repositry = {};

  OverSeer() {
    register(ContactManager, ContactManager());
    register(CounterManger, CounterManger());
  }

  register(name, object) {
    repositry[name] = object;
  }

  fetch(name) => repositry[name];
}
