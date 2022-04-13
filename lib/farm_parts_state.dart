import 'package:flutter/material.dart';
import 'package:gps_tracker/style.dart';

class TalhaoDisplay {
  String name;
  double area;

  TalhaoDisplay(this.name, this.area);
}

class FarmPartsWidget extends StatefulWidget {
  @override
  State createState() {
    return FarmPartsState();
  }
}

class FarmPartsState extends State<FarmPartsWidget> {
  String farmName;

  var talhoes = [];

  FarmPartsState() {
    this.farmName = "Faz Demo";
    talhoes.add(TalhaoDisplay("Talhao 1", 100));
    talhoes.add(TalhaoDisplay("Talhao 2", 27));
    talhoes.add(TalhaoDisplay("Talhao 5", 35));
  }

  _getRowsForTalhoes() {
    var rows = List<Widget>();
    for (var talhao in this.talhoes) {
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(talhao.name,
              style: AppStyleValues.appTextDecoration.copyWith(
                color: AppStyleValues.appSecondaryColor,
              )),
          Text(talhao.area.toStringAsFixed(1) + "ha",
              style: AppStyleValues.appTextDecoration.copyWith(
                color: AppStyleValues.appSecondaryColor,
              ))
        ],
      ));
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    double totalArea = 0;
    for (var talhao in talhoes) {
      totalArea += talhao.area;
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20), bottom: Radius.zero),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/purple_previous.png"),
                Text(
                  "Faz Demo",
                  style: AppStyleValues.appTextDecorationBig.copyWith(
                    color: AppStyleValues.appSecondaryColor,
                  ),
                ),
                Image.asset("assets/purple_next.png"),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _getRowsForTalhoes(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "Área Total: " + totalArea.toStringAsFixed(1) + "ha",
                style: AppStyleValues.appTextDecorationBig.copyWith(color: AppStyleValues.appSecondaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
