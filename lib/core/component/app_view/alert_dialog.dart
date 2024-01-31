import 'package:flutter/material.dart';

Future<void> showMyDialog(BuildContext context,
    {required Widget content, List<Widget>? actions,}) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding:const EdgeInsets.only(top: 20),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        content:  content,
        actions: actions,
      );
    },
  );
}
