import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gps_tracker/style.dart';
import 'package:gps_tracker/user_activites.dart';
import 'package:gps_tracker/user_new_activity.dart';
import 'package:gps_tracker/user_setings.dart';

class UserScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserState();
  }
}

class UserState extends State<UserScreen> {
  void switchToNewActivity() {
    this._shownScreen = new UserNewActivity();
    this.setState(() {});
  }

  UserActivities activities;

  Widget _shownScreen;

  void switchScreen() {
    if (this._shownScreen is UserActivities) {
      this._shownScreen = UserSettings();
    } else if (this._shownScreen is UserSettings) {
      this._shownScreen = this.activities;
    }
    this.setState(() {});
  }

  UserState() {
    this.activities = UserActivities(onNewActivityPressed: this.switchToNewActivity);
    this._shownScreen = activities;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight, DeviceOrientation.portraitUp]);
    SystemChrome.restoreSystemUIOverlays();
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Container(
        color: AppStyleValues.appMainColor,
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: AppStyleValues.appTextDecorationBig,
                              children: const <TextSpan>[
                                TextSpan(text: 'Olá '),
                                TextSpan(text: 'Usuário', style: AppStyleValues.appTextDecorationBigBold),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/gnss.png",
                                    height: 20,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/connectivity.png",
                                    height: 20,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/db_connectivity.png",
                                    height: 20,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: switchScreen,
                            child: Image.asset("assets/default_user.png", height: 70),
                          ),
                        )
                      ],
                    ),
                    flex: 0,
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: const Radius.circular(20),
                      bottom: const Radius.circular(0),
                    ),
                    color: Colors.white,
                  ),
                  child: this._shownScreen,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if (this._shownScreen is UserNewActivity || this._shownScreen is UserSettings) {
      this._shownScreen = this.activities;
      this.setState(() {});
      return false;
    } else
      return true;
  }
}
