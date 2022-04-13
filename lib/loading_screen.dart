import 'package:flutter/material.dart';
import 'style.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
          color: AppStyleValues.appMainColor,
          child: Column(
            children: [
              Expanded(
                child: Center(
                    child: Image.asset(
                  "assets/logo.png",
                  width: 200,
                )),
                flex: 9,
              ),
              Expanded(
                child: Text(
                  "appName",
                  style: AppStyleValues.appTextDecoration,
                ),
                flex: 1,
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
          )),
      color: AppStyleValues.appMainColor,
    );
  }
}
