import 'package:flutter/material.dart';

void navigateTo(BuildContext context, Widget routeWidget) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => routeWidget),
  );
}

void navigateBack(BuildContext context) {
  Navigator.of(context).pop();
}

void navigateAndReplace(BuildContext context, Widget routeWidget) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => routeWidget),
  );
}
