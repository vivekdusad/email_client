import 'package:email_client/managers/contactManager.dart';
import 'package:email_client/managers/counterManger.dart';
import 'package:email_client/managers/usermanager.dart';
import 'package:email_client/views/message_compose.dart';

class OverSeer {
  Map<dynamic, dynamic> repositry = {};

  OverSeer() {
    register(ContactManager, ContactManager());
    register(CounterManger, CounterManger());
    register(MessageComposeManager, MessageComposeManager());
  }

  register(name, object) {
    repositry[name] = object;
  }

  fetch(name) => repositry[name];
}
