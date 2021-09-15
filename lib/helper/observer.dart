import 'package:flutter/material.dart';

class Observer<T> extends StatelessWidget {
  Observer(
      {Key? key,
      this.onError,
      this.onLoading,
      required this.onSuccess,
      required this.stream})
      : super(key: key);

  Stream<T>? stream;
  Function? onError;
  Function? onSuccess;
  Function? onLoading;

  _defaultLoading() => Center(
        child: CircularProgressIndicator(),
      );
  _defaultError(context, error) => Center(
        child: Text(error.toString()),
      );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.hasError) {
          return onError!(context, snapshot.error) ??
              _defaultError(context, snapshot.error);
        }
        if (snapshot.hasData) {
          T? data = snapshot.data;
          return onSuccess!(context, data);
        }
        return onLoading ?? _defaultLoading();
      },
    );
  }
}
