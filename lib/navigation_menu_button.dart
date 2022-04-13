import 'package:flutter/material.dart';
import 'package:gps_tracker/style.dart';

class NavMenuButton extends StatelessWidget {
  VoidCallback onPressed;
  String imagePath;

  NavMenuButton({@required this.onPressed,@required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: this.onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(AppStyleValues.appMainColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: AppStyleValues.appMainColor),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          width: 50,
          height: 50,
          child: Image.asset(
            this.imagePath,
            height: 50,
          ),
        ),
      ),
    );
  }
}
