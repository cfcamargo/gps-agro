import 'package:flutter/material.dart';
import 'package:gps_tracker/style.dart';

typedef StringCallback = void Function(String);

class UserNewActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
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
              "Nova Atividade:",
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.grey[200],
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomDropDownBtn((value) {}, ["Fazenda Demo"], "Fazenda"),
                      CustomDropDownBtn((value) {}, ["Talhão 1", "Talhão 2", "Talhão 5"], "Talhão"),
                      CustomDropDownBtn((value) {}, ["Pulverização 24D", "Calcário"], "Atividade"),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Largura de aplicação",
                                  style: AppStyleValues.appTextDecoration.copyWith(color: AppStyleValues.appMainColor),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Material(
                                    child: TextField(
                                      style: AppStyleValues.appTextDecorationBig
                                          .copyWith(color: AppStyleValues.appSecondaryColor),
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.all(20),
                                      ),
                                    ),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Dose de aplicação",
                                    style: AppStyleValues.appTextDecoration.copyWith(color: AppStyleValues.appMainColor),
                                  ),
                                  Material(
                                    child: TextField(
                                      style: AppStyleValues.appTextDecorationBig
                                          .copyWith(color: AppStyleValues.appSecondaryColor),
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        hintText: "Opcional",
                                        hintStyle: AppStyleValues.appTextDecoration.copyWith(color: Colors.grey[300]),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.all(20),
                                      ),
                                    ),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset("assets/green_satellite_ok.png", height: 42,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Conectado",
                                    style: AppStyleValues.appTextDecorationMedium
                                        .copyWith(color: AppStyleValues.appSecondaryColor)),
                                Text("Quantidade de satelites: 7",
                                    style: AppStyleValues.appTextDecorationMedium
                                        .copyWith(color: AppStyleValues.appSecondaryColor)),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppStyleValues.appMainColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                  child: Image.asset(
                    "assets/init_activity.png",
                    height: 35,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                  child: Text(
                    "Iniciar Trabalho",
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

class CustomDropDownBtn extends StatefulWidget {
  final StringCallback _onValueChanged;
  final List<String> _values;
  final String _hintText;

  CustomDropDownBtn(this._onValueChanged, this._values, this._hintText);

  @override
  State createState() {
    return CustomDropDownState(this._onValueChanged, this._values, this._hintText);
  }
}

class CustomDropDownState extends State<CustomDropDownBtn> {
  String _dropDownValue;

  String _hintText;

  List<String> _values;

  StringCallback _onValueChanged;

  CustomDropDownState(this._onValueChanged, this._values, this._hintText) {
    this._dropDownValue = null;
  }

  void _onChanged(String value) {
    this.setState(() {
      this._dropDownValue = value;
      this._onValueChanged(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        child: Container(
          decoration: BoxDecoration(
            color: AppStyleValues.appMainColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButton(
              hint: Text(
                this._hintText,
                style: AppStyleValues.appTextDecorationBig.copyWith(color: Colors.grey),
              ),
              icon: Icon(
                Icons.arrow_drop_down_sharp,
                size: 64,
              ),
              iconEnabledColor: Colors.grey[200],
              dropdownColor: AppStyleValues.appMainColor,
              value: this._dropDownValue,
              iconSize: 24,
              elevation: 16,
              underline: Container(height: 0),
              onChanged: this._onChanged,
              style: AppStyleValues.appTextDecorationBig,
              isExpanded: true,
              items: this._values.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
