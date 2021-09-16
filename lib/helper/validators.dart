import 'dart:async';

mixin Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (data, sink) {
    if (data.contains('@')) {
      sink.add(data);
    } else {
      sink.addError("Enter Valid Email");
    }
  });
  final validateSubject =
      StreamTransformer<String, String>.fromHandlers(handleData: (data, sink) {
    if (data.length > 4) {
      sink.add(data);
    } else if (data.isEmpty) {
      sink.addError("can't be empty");
    } else {
      sink.addError("must be >4");
    }
  });
  final validateBody =
      StreamTransformer<String, String>.fromHandlers(handleData: (data, sink) {
    if (data.length > 10) {
      sink.add(data);
    } else if (data.isEmpty) {
      sink.addError("can't be empty");
    } else {
      sink.addError("must be >10");
    }
  });
}
