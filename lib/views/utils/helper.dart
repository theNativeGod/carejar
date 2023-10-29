import 'package:flutter/material.dart';

void navigateTo(BuildContext context, Widget screen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => screen));
}

void pop(BuildContext context) {
  Navigator.pop(context);
}
