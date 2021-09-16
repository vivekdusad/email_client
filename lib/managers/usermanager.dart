import 'dart:async';

import 'package:email_client/helper/alerts.dart';
import 'package:email_client/helper/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class MessageComposeManager with Validators, Alerts {
  BehaviorSubject<String> _emailSubject = BehaviorSubject<String>();
  Stream<String> get email$ => _emailSubject.stream.transform(validateEmail);
  Sink<String> get inEmail => _emailSubject.sink;

  BehaviorSubject<String> _subject = BehaviorSubject<String>();
  Stream<String> get subject$ => _subject.stream.transform(validateSubject);
  Sink<String> get inSubject => _subject.sink;

  BehaviorSubject<String> _bodySubject = BehaviorSubject<String>();
  Stream<String> get body$ => _bodySubject.stream.transform(validateBody);
  Sink<String> get inBody => _bodySubject.sink;

  Stream<bool> get isFormValid$ => CombineLatestStream(
      [_emailSubject, _bodySubject, _subject], (values) => true);

  void submit(BuildContext context) {
    showSnackBar(context, "Saved");
  }

  void dispose() {
    _emailSubject.close();
    _subject.close();
    _bodySubject.distinct();
  }
}
