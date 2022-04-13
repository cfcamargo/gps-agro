import 'package:flutter/material.dart';
import 'package:gps_tracker/style.dart';

class FarmActivityCard extends StatelessWidget {
  String farmName = "Faz Demo";
  String partName = "Talhão 1";
  String activityName = "Pulverização 24D";
  double totalAreaHa = 100;
  double workedArea = 70;
  double overWorked = 2;

  FarmActivityCard({
    this.farmName,
    this.partName,
    this.activityName,
    this.totalAreaHa,
    this.workedArea,
    this.overWorked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 600,
        height: 290,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    "${this.farmName} - ${this.partName}",
                    style: AppStyleValues.appTextDecorationBig.copyWith(
                      color: AppStyleValues.appSecondaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "${this.activityName}",
                    style: AppStyleValues.appTextDecoration.copyWith(
                      color: AppStyleValues.appMainColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "Área Total: ${this.totalAreaHa} ha",
                    style: AppStyleValues.appTextDecoration.copyWith(
                      color: AppStyleValues.appMainColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "Área Aplicada: ${this.workedArea} ha",
                    style: AppStyleValues.appTextDecoration.copyWith(
                      color: AppStyleValues.appMainColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "Área Sem Aplicar: ${this.totalAreaHa - this.workedArea} ha",
                    style: AppStyleValues.appTextDecoration.copyWith(
                      color: AppStyleValues.appMainColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "Sobreaplicado: ${this.overWorked}%",
                    style: AppStyleValues.appTextDecoration.copyWith(
                      color: AppStyleValues.appMainColor,
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: Image.asset("assets/purple_pause.png"),
          ),
        ));
  }
}
