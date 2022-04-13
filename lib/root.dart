import 'package:flutter/material.dart';
import 'package:gps_tracker/login_screen.dart';
import 'package:gps_tracker/user_screen.dart';
import 'package:gps_tracker/navigation.dart';

class RootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: LoginScreen(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/user': (context) => UserScreen(),
        '/navigation': (context) => GpsTracking(),
      },
    );
  }
}
