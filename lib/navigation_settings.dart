import 'package:flutter/material.dart';
import 'package:gps_tracker/navigation_custom_dropdown.dart';
import 'package:gps_tracker/navigation_map.dart';
import 'package:gps_tracker/style.dart';

class GpsTrackingSettings extends StatefulWidget {
  VoidCallback okPressed;

  GpsTrackingSettings({@required this.okPressed});

  @override
  State createState() {
    return GpsTrackingSettingsState(okPressed: this.okPressed);
  }
}

class GpsTrackingSettingsState extends State<GpsTrackingSettings> {
  VoidCallback okPressed;

  GpsTrackingSettingsState({@required this.okPressed});

  void onFonteGNSSChanged(String valor) {
    if(valor == "Bluetooth") {
      GPSTracker.initialize();
    }
  }

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
                    child: Image.asset("assets/purple_settings.png", height: 35),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Configurações",
                      style: AppStyleValues.appTextDecorationBold.copyWith(color: AppStyleValues.appMainColor),
                    ),
                  ),
                ],
              ),
              LabeledCustomDropDownBtn("Fonte GNSS", ["Bluetooth", "Interno"], "Fonte GNSS", onFonteGNSSChanged),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Largura de Aplicação",
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
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Tanque",
                      style: AppStyleValues.appTextDecorationMedium.copyWith(color: AppStyleValues.appMainColor),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
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
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            style: TextButton.styleFrom(backgroundColor: AppStyleValues.appMainColor),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/green_plus_circle.png",
                                    height: 30,
                                    width: 31,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Carregar",
                                    style: AppStyleValues.appTextDecorationMedium
                                        .copyWith(color: AppStyleValues.appSecondaryColor),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: CustomDropDownBtn(["Kg/ha", "L/ha"], "Dosagem", (value) {}),
                      ),
                    ],
                  ),
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
                    style: AppStyleValues.appTextDecoration.copyWith(
                      color: AppStyleValues.appSecondaryColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
