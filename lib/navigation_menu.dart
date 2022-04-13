import 'package:flutter/material.dart';
import 'package:gps_tracker/farm_parts_add_part.dart';
import 'package:gps_tracker/navigation_menu_button.dart';

class GpsTrackingMenu extends StatefulWidget {
  StringCallback _requestStateChange;

  GpsTrackingMenu(this._requestStateChange);

  @override
  State createState() {
    return GpsTrackingMenuState(requestStateChange: this._requestStateChange);
  }
}

enum CurveType { LINEAR, FREE, CURVE, NONE }

class GpsTrackingMenuState extends State<GpsTrackingMenu> {
  CurveType _curve = CurveType.LINEAR;

  StringCallback requestStateChange;

  GpsTrackingMenuState({this.requestStateChange});

  List<Widget> _getRowForCurve() {
    List<Widget> row = List<Widget>();
    if (this._curve == CurveType.LINEAR) {
      row.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: NavMenuButton(
            onPressed: () {
              setCurveType(CurveType.NONE);
            },
            imagePath: 'assets/white_reta_ab.png',
          ),
        ),
      );
    } else if (this._curve == CurveType.CURVE) {
      row.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: NavMenuButton(
            onPressed: () {
              setCurveType(CurveType.NONE);
            },
            imagePath: 'assets/white_curva_ab.png',
          ),
        ),
      );
    } else if (this._curve == CurveType.FREE) {
      row.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: NavMenuButton(
            onPressed: () {
              setCurveType(CurveType.NONE);
            },
            imagePath: 'assets/white_curva_livre.png',
          ),
        ),
      );
    } else {
      row.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: NavMenuButton(
            onPressed: () {
              setCurveType(CurveType.LINEAR);
            },
            imagePath: 'assets/white_reta_ab.png',
          ),
        ),
      );
      row.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: NavMenuButton(
            onPressed: () {
              setCurveType(CurveType.CURVE);
            },
            imagePath: 'assets/white_curva_ab.png',
          ),
        ),
      );
      row.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: NavMenuButton(
            onPressed: () {
              setCurveType(CurveType.FREE);
            },
            imagePath: 'assets/white_curva_livre.png',
          ),
        ),
      );
    }
    return row;
  }

  void setCurveType(CurveType type) {
    setState(() {
      this._curve = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: _getRowForCurve(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: NavMenuButton(
              onPressed: () {
                requestStateChange("open");
              },
              imagePath: 'assets/white_file_open.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: NavMenuButton(
              onPressed: () {
                requestStateChange("new");
              },
              imagePath: 'assets/white_folder_create.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: NavMenuButton(
              onPressed: () {},
              imagePath: 'assets/white_save.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: NavMenuButton(
              onPressed: () {
                requestStateChange("settings");
              },
              imagePath: 'assets/white_config.png',
            ),
          ),
        ],
      ),
    );
  }
}
