import 'package:chatweb/widget/layout/loading_dialog.dart';
import 'package:chatweb/widget/layout/success_dialog.dart';
import 'package:flutter/material.dart';

abstract class DialogMixin {
  void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }

  void showProcessingDialog(
    BuildContext context, {
    String text = '',
    bool dismissible = false,
  }) async {
    if (text != null && text == '') {
      text = 'Processing...';
    }

    return showDialog(
      barrierDismissible: dismissible,
      context: context,
      builder: (BuildContext context) {
        return LoadingDialog(text: text);
      },
    );
  }

  void showSuccessDialog(
    BuildContext context, {
    String text: '',
    bool dismissible = false,
  }) async {
    if (text != null && text == '') {
      text = 'Succeed';
    }

    return showDialog(
        barrierDismissible: dismissible,
        context: context,
        builder: (BuildContext context) {
          return SuccessDialog(text: text);
        });
  }
}
