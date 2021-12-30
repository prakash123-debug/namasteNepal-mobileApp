// import 'package:bootwal_nagarpalika_app/Providers/alertControlProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void alertMessage({
  required String title,
  required String description,
  required BuildContext context,
  required AlertType type,
  required Color color,
  required String buttonMessage,
}) {
  Alert(
    context: context,
    type: type,
    title: title,
    desc: description,
    buttons: [
      DialogButton(
        color: color,
        child: Text(
          buttonMessage,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () {
          // Provider.of<AlertControlProvider>(context, listen: false)
          //     .resetAlert();
          // Navigator.pop(context);
        },
        width: 120,
      )
    ],
  ).show();
}
