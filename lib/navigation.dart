import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gps_tracker/navigation_interface.dart';
import 'package:gps_tracker/navigation_map.dart';

class GpsTracking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Container(
      child: Stack(
        children: [
          NavigationMap(),
          GpsTrackingGUI(),
        ],
      ),
    );
  }
}
