import 'package:flutter/material.dart';
import 'package:gps_tracker/navigation_map.dart';
import 'package:gps_tracker/navigation_menu.dart';
import 'package:gps_tracker/navigation_new.dart';
import 'package:gps_tracker/style.dart';
import 'package:gps_tracker/navigation_open.dart';
import 'package:gps_tracker/navigation_settings.dart';

class GpsTrackingGUI extends StatefulWidget {
  @override
  State createState() {
    return GpsTrackingGUIState();
  }
}

class GpsTrackingGUIState extends State<GpsTrackingGUI> {
  String _state = "menu";

  Widget _getWidgetForState() {
    if (this._state == "open") {
      return GpsTrackingOpen(okPressed: () {
        setState(() {
          this._state = "menu";
        });
      });
    } else if (this._state == "new") {
      return GpsTrackingNew(okPressed: () {
        setState(() {
          this._state = "menu";
        });
      });
    } else if (this._state == "settings") {
      return GpsTrackingSettings(okPressed: () {
        setState(() {
          this._state = "menu";
        });
      });
    }
    return GpsTrackingMenu((state) {
      setState(() {
        this._state = state;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset("assets/purple_full_batery.png", height: 25),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Text(
                          "Calcário",
                          style: AppStyleValues.appTextDecorationMediumBold.copyWith(
                            color: AppStyleValues.appMainColor,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Container(
                          child: Stack(children: [
                            Container(
                              height: 25,
                              width: 120,
                              decoration: BoxDecoration(
                                color: AppStyleValues.appMainColor,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Text(
                                "Disp: 7500 kg",
                                style: AppStyleValues.appTextDecorationMediumBold
                                    .copyWith(color: AppStyleValues.appSecondaryColor),
                              ),
                            )
                          ]),
                          height: 25,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Image.asset("assets/purple_width.png", height: 25),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Image.asset("assets/purple_refresh.png", height: 25),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Image.asset("assets/purple_satellite_ok.png", height: 25),
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(color: Color.fromARGB(70, 127, 127, 127)),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onScaleUpdate: (details) {MapPainter.onScale(details);},
                        onScaleStart: MapPainter.onScaleStart,
                      ),
                    ),
                    _getWidgetForState(),
                  ],
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppStyleValues.appMainColor,
                  ),
                  width: 50,
                  height: 50,
                ),
              )
            ],
          ),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
