import 'package:flutter/material.dart';
import 'package:gps_tracker/style.dart';
typedef StringCallback = void Function(String string);

class LabeledCustomDropDownBtn extends StatelessWidget {
  final String _labelName;

  final List<String> _values;
  final String _hintText;

  final StringCallback _onChanged;

  LabeledCustomDropDownBtn(this._labelName, this._values, this._hintText, this._onChanged);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            this._labelName,
            style: AppStyleValues.appTextDecorationMedium.copyWith(color: AppStyleValues.appMainColor),
          ),
        ),
        CustomDropDownBtn(_values, _hintText, this._onChanged),
      ],
    );
  }
}

class CustomDropDownBtn extends StatefulWidget {
  final List<String> _values;
  final String _hintText;

  final StringCallback _onChanged;

  CustomDropDownBtn(this._values, this._hintText, this._onChanged);

  @override
  State createState() {
    return CustomDropDownState(this._values, this._hintText, this._onChanged);
  }
}

class CustomDropDownState extends State<CustomDropDownBtn> {
  List<String> _values;
  String _dropDownValue;
  String _hintText;

  StringCallback _onChanged;

  CustomDropDownState(this._values, this._hintText, this._onChanged) {
    this._dropDownValue = null;
  }

  void _onValueChanged(String value) {
    this.setState(() {
      this._dropDownValue = value;
      this._onChanged(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton(
            hint: Text(
              this._hintText,
              style: AppStyleValues.appTextDecorationBig.copyWith(color: Colors.grey),
            ),
            icon: Icon(
              Icons.arrow_drop_down_sharp,
              size: 64,
            ),
            iconEnabledColor: AppStyleValues.appMainColor,
            dropdownColor: Colors.white,
            value: this._dropDownValue,
            iconSize: 24,
            elevation: 16,
            underline: Container(height: 0),
            onChanged: this._onValueChanged,
            style: AppStyleValues.appTextDecorationBig.copyWith(color: AppStyleValues.appSecondaryColor),
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
