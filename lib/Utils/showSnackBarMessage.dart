import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namaste_nepal/Utils/colorsSelect.dart';
import 'package:namaste_nepal/Utils/customPageRoute.dart';

class SnackBarViewer {
  SelectColor selectColor = new SelectColor();
  sucessSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      backgroundColor: selectColor.sucessColor,
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      action: SnackBarAction(
        label: 'Home Page',
        textColor: selectColor.cardColor,
        onPressed: () {
          // Some code to undo the change.
          Navigator.pop(context);
        },
      ),
    );
    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  errorSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      backgroundColor: selectColor.errorColor,
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      action: SnackBarAction(
        label: 'Edit',
        textColor: selectColor.cardColor,
        onPressed: () {
          // Some code to undo the change.
          // Navigator.pop(context);
        },
      ),
    );
    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
