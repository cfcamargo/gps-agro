import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'style.dart';

class LoginScreen extends StatelessWidget {
  void _onLoginPressed(context) {
    Navigator.popAndPushNamed(context, '/user');
  }

  void _onUseOfflinePressed(context) {
    Navigator.pushNamed(context, '/navigation');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight, DeviceOrientation.portraitUp]);
    SystemChrome.restoreSystemUIOverlays();
    return Container(
      color: AppStyleValues.appMainColor,
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/logo.png",
                    width: 120,
                  ),
                  flex: 4,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(35, 5, 35, 5),
                        child: Material(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "email",
                                contentPadding: EdgeInsets.fromLTRB(12, 2, 12, 2),
                                border: AppStyleValues.appLoginFormBorder),
                          ),
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(const Radius.circular(10)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(35, 5, 35, 5),
                        child: Material(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "senha",
                                contentPadding: EdgeInsets.fromLTRB(12, 2, 12, 2),
                                border: AppStyleValues.appLoginFormBorder,
                                fillColor: Colors.white),
                          ),
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(const Radius.circular(10)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(35, 5, 35, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(backgroundColor: AppStyleValues.appSecondaryColor),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(12, 2, 12, 2),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: Image.asset("assets/login.png", height: 20),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        "LOGIN",
                                        style: AppStyleValues.appTextDecorationMediumBold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onPressed: () {
                                _onLoginPressed(context);
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  flex: 4,
                ),
                Expanded(
                  child: Material(),
                  flex: 1,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {  },
                        style: TextButton.styleFrom(side: BorderSide(color: Colors.white, width: 2)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Criar Conta",
                            style: AppStyleValues.appTextDecorationMedium,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "ou",
                          style: AppStyleValues.appTextDecorationSmall,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _onUseOfflinePressed(context);
                        },
                        style: TextButton.styleFrom(side: BorderSide(color: Colors.white, width: 2)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Usar Offline",
                            style: AppStyleValues.appTextDecorationMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  flex: 3,
                ),
              ],
            ),
            flex: 15,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "appName",
                  style: AppStyleValues.appTextDecorationSmall,
                ),
                Text(
                  "Todos os direitos reservados",
                  style: AppStyleValues.appTextDecorationSmall,
                ),
              ],
            ),
            flex: 1,
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
      ),
    );
  }
}
