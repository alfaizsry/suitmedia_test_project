import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlert {
  CustomAlert({required this.context});
  final BuildContext context;

  Future alertDialog({required String label, required Color? colors}) {
    return showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(label,
                textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w600)),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey[50],
                  ),
                  child: Center(
                    child: Text('Close',
                        style: TextStyle(color: colors, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
