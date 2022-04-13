import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gps_tracker/style.dart';

typedef StringCallback = void Function(String);

class FarmPartsAddPart extends StatefulWidget {
  @override
  State createState() {
    return FarmPartsAddPartState();
  }
}

class FarmPartsAddPartState extends State<FarmPartsAddPart> {
  String dropDownValue = "Fazenda";

  void onChangedFirstDropDown(String value) {
    this.setState(() {
      this.dropDownValue = value;
    });
  }

  List<Widget> getChildListDropDowns() {
    List<Widget> children = [
      CustomDropDownBtn(this.onChangedFirstDropDown, ["Fazenda", "Talhão"], "Fazenda")
    ];
    if (this.dropDownValue == "Talhão") {
      children.add(CustomDropDownBtn((value) {}, ["Fazenda Demo"], "Fazenda Demo"));
    }
    children.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        child: TextField(
          style: AppStyleValues.appTextDecorationBig.copyWith(color: AppStyleValues.appSecondaryColor),
          decoration: InputDecoration(
              hintText: "Nome",
              border: InputBorder.none,
              hintStyle: AppStyleValues.appTextDecorationBig.copyWith(color: Colors.black38),
              contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5)),
        ),
      ),
    ));
    children.add(
      Expanded(
        child: Container(),
      ),
    );
    children.add(
      TextButton(
        onPressed: () {},
        child: Text(
          "Salvar",
          style: AppStyleValues.appTextDecorationBig.copyWith(color: AppStyleValues.appSecondaryColor),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppStyleValues.appMainColor),
        ),
      ),
    );
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
                bottom: Radius.zero,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: getChildListDropDowns(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomDropDownBtn extends StatefulWidget {
  final StringCallback _onValueChanged;
  final List<String> _values;
  final String _dropDownValue;

  CustomDropDownBtn(this._onValueChanged, this._values, this._dropDownValue);

  @override
  State createState() {
    return CustomDropDownState(this._onValueChanged, this._values, this._dropDownValue);
  }
}

class CustomDropDownState extends State<CustomDropDownBtn> {
  String _dropDownValue;

  List<String> _values;

  StringCallback _onValueChanged;

  CustomDropDownState(this._onValueChanged, this._values, this._dropDownValue);

  void _onChanged(String value) {
    this.setState(() {
      this._dropDownValue = value;
      this._onValueChanged(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: DropdownButton(
            value: _dropDownValue,
            dropdownColor: Colors.white,
            focusColor: Colors.white,
            iconSize: 24,
            elevation: 16,
            underline: Container(height: 0),
            onChanged: this._onChanged,
            style: AppStyleValues.appTextDecorationBig.copyWith(color: AppStyleValues.appSecondaryColor, backgroundColor: Colors.white),
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
    );
  }
}
