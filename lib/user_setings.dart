import 'package:flutter/material.dart';
import 'package:gps_tracker/farm_parts_state.dart';
import 'package:gps_tracker/style.dart';

import 'farm_parts_add_part.dart';

class UserSettings extends StatefulWidget {
  State<StatefulWidget> state;

  @override
  State<StatefulWidget> createState() {
    this.state = UserSettingsState();
    return this.state;
  }
}

class UserSettingsState extends State<UserSettings> {

  void displayOverEntry() {
    showDialog(context: context, builder: (context) => FarmPartsAddPart());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Nome:",
            style: AppStyleValues.appTextDecoration.copyWith(
              color: AppStyleValues.appMainColor,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Fulano de Tal da Silva",
                style: AppStyleValues.appTextDecorationBig.copyWith(
                  color: AppStyleValues.appSecondaryColor,
                ),
              ),
            ),
          ),
          Text(
            "Propriedades:",
            style: AppStyleValues.appTextDecoration.copyWith(
              color: AppStyleValues.appMainColor,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: FarmPartsWidget()),
                TextButton(
                    onPressed: displayOverEntry,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppStyleValues.appMainColor),
                    ),
                    child: Text(
                      "Adicionar",
                      style: AppStyleValues.appTextDecorationBig,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
