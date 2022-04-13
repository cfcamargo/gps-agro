import 'package:flutter/material.dart';
import 'package:gps_tracker/style.dart';
import 'package:gps_tracker/navigation_farm_activity_card.dart';

class GpsTrackingOpen extends StatefulWidget {
  VoidCallback okPressed;

  GpsTrackingOpen({@required this.okPressed});

  @override
  State createState() {
    return GpsTrackingOpenState(okPressed: this.okPressed);
  }
}

class GpsTrackingOpenState extends State<GpsTrackingOpen> {
  VoidCallback okPressed;

  GpsTrackingOpenState({@required this.okPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppStyleValues.appGrayBg,
      ),
      width: 616,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/purple_file_open.png", height: 30),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "ABRIR",
                style: AppStyleValues.appTextDecorationBold.copyWith(color: AppStyleValues.appMainColor),
              ),
            ),
          ]),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FarmActivityCard(
                    farmName: "FazendaDemo",
                    partName: "Talhão 1",
                    activityName: "Calcário",
                    totalAreaHa: 100.0,
                    workedArea: 20.0,
                    overWorked: 0,
                  ),
                  FarmActivityCard(
                    farmName: "FazendaDemo",
                    partName: "Talhão 5",
                    activityName: "Pulverização 24D",
                    totalAreaHa: 100.0,
                    workedArea: 100.0,
                    overWorked: 2.0,
                  ),
                  FarmActivityCard(
                    farmName: "FazendaDemo",
                    partName: "Talhão 2",
                    activityName: "Pulverização 24D",
                    totalAreaHa: 60.0,
                    workedArea: 60.0,
                    overWorked: 5.0,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                okPressed();
              },
              style: TextButton.styleFrom(backgroundColor: AppStyleValues.appMainColor),
              child: Text(
                "OK",
                style: AppStyleValues.appTextDecoration.copyWith(
                  color: AppStyleValues.appSecondaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
