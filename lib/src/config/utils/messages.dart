import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter/material.dart';

class AppMessages {

  static void showToast(BuildContext context,
      {String message = '', Color backgroundColor = Colors.black}) {
    var themeData = Theme.of(context);
    showToastWidget(
      alignment: Alignment.topCenter,
      axis: Axis.vertical,
      Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style:
         TextStyle(color: Colors.white) ,
          maxLines: 4,
        ),
      ),
      animation: StyledToastAnimation.slideFromBottomFade,


      position:
      const StyledToastPosition(align: Alignment.bottomCenter, offset: 80.0),
      duration: const Duration(seconds: 4),
      animDuration: const Duration(milliseconds: 400),
      curve: Curves.linearToEaseOut,
      reverseCurve: Curves.fastOutSlowIn,
      context: context,
    );
  }

  static showAlertDialog(BuildContext context,
      {required String title,
        bool canDissmiss = true,
        bool hasCancell = true,
        required String dialogText,
        String yesBtn = 'بله',
        required Function() onTapYes}) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("لغو"),
      onPressed: () {
        //TODO context.pop();
      },
    );
    Widget continueButton = TextButton(
      onPressed: onTapYes,
      child: Text(yesBtn),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(dialogText),
      actions: [
        if (hasCancell) cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      barrierDismissible: canDissmiss,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async {
              if (canDissmiss) {
                return true;
              } else {
                return false;
              }
            },
            child: alert);
      },
    );
  }
}
