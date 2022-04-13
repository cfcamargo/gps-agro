import 'package:flutter/material.dart';
import 'package:gps_tracker/style.dart';
import 'package:gps_tracker/navigation_custom_dropdown.dart';

class GpsTrackingNew extends StatefulWidget {
  VoidCallback okPressed;

  GpsTrackingNew({@required this.okPressed});

  @override
  State createState() {
    return GpsTrackingNewState(okPressed: this.okPressed);
  }
}

class GpsTrackingNewState extends State<GpsTrackingNew> {
  VoidCallback okPressed;

  GpsTrackingNewState({@required this.okPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      child: Material(
        color: AppStyleValues.appGrayBg,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/purple_circle_new_file.png", height: 35),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "NOVO",
                      style: AppStyleValues.appTextDecorationBold.copyWith(color: AppStyleValues.appMainColor),
                    ),
                  ),
                ],
              ),
              LabeledCustomDropDownBtn("Fazenda", ["Fazenda Demo"], "Nome da Fazenda", (name) {}),
              LabeledCustomDropDownBtn("Talhão", ["Talhão 1", "Talhão 2", "Talhão 5"], "Nome do Talhão", (name) {}),
              LabeledCustomDropDownBtn("Atividade", ["Pulverização 24D", "Calcário"], "Nome da Atividade", (name) {}),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Dose de aplicação",
                      style: AppStyleValues.appTextDecorationMedium.copyWith(color: AppStyleValues.appMainColor),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  style: AppStyleValues.appTextDecorationBig
                                      .copyWith(color: AppStyleValues.appSecondaryColor),
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.all(8),
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),),
                      Expanded(
                        flex: 4,
                        child: CustomDropDownBtn(["L/ha", "Kg/ha"], "Dosagem", (name) {}),
                      )
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Largura de aplicação",
                      style: AppStyleValues.appTextDecorationMedium.copyWith(color: AppStyleValues.appMainColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          style: AppStyleValues.appTextDecorationBig.copyWith(color: AppStyleValues.appSecondaryColor),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.all(8),
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
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
                    style: AppStyleValues.appTextDecorationBig.copyWith(
                      color: AppStyleValues.appSecondaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}