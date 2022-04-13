import 'package:flutter/material.dart';
import 'package:gps_tracker/login_screen.dart';
import 'package:gps_tracker/loading_screen.dart';
import 'package:gps_tracker/navigation_map.dart';
import 'package:gps_tracker/root.dart';
import 'package:gps_tracker/user_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ActivityData.initialize();
  runApp(RootWidget());
}