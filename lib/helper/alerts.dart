import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin Alerts {
  showSnackBar(BuildContext context, String text, {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
