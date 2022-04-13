import 'package:flutter/material.dart';
import 'package:gps_tracker/farm_activity_state.dart';
import 'package:gps_tracker/style.dart';

class UserActivities extends StatelessWidget {
  final VoidCallback onNewActivityPressed;

  UserActivities({@required this.onNewActivityPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 5, 0),
              child: Image.asset(
                "assets/tractor_icon.png",
                height: 35,
              ),
            ),
            Text(
              "Atividades:",
              style: AppStyleValues.userActivitiesTitleTextDecoration.copyWith(
                shadows: [
                  Shadow(
                    color: Colors.black38,
                    offset: Offset(2, 2),
                    blurRadius: 3,
                  )
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                FarmActivityWidget("Faz Demo", "Talhão 1", "Pulverização 24D", 100, 70, 2, 6),
                FarmActivityWidget("Faz Demo", "Talhão 5", "Calcário", 35, 35, 8, 8),
                FarmActivityWidget("Faz Demo", "Talhão 2", "Calcário", 27, 27, 12, 10),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextButton(
            onPressed: this.onNewActivityPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppStyleValues.appMainColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                  child: Image.asset(
                    "assets/new_activity.png",
                    height: 35,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                  child: Text(
                    "Nova Atividade",
                    style: AppStyleValues.appTextDecorationBold,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
