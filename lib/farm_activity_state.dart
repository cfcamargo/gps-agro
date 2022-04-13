import 'package:flutter/material.dart';
import 'package:gps_tracker/style.dart';
import 'package:pie_chart/pie_chart.dart';

class FarmActivityWidget extends StatelessWidget {
  String _farmName = "Faz Demo";
  String _partName = "Talhão 1";
  String _activityName = "Pulverização 24D";
  double _totalAreaHa = 100;
  double _workedArea = 70;
  double _overWorked = 2;
  double _avgSpeed = 9.1;

  FarmActivityWidget(
      [this._farmName,
      this._partName,
      this._activityName,
      this._totalAreaHa,
      this._workedArea,
      this._overWorked,
      this._avgSpeed]);

  static const TextStyle mainTitleStyle = TextStyle(
    color: AppStyleValues.appMainColor,
    fontFamily: 'Roboto',
    fontSize: 26,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle secondaryTextStyle = TextStyle(
    color: AppStyleValues.appSecondaryColor,
    fontFamily: 'Roboto',
    fontSize: 16,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.normal,
  );

  Map<String, double> getDataMap() {
    Map<String, double> dataMap = {
      "Sem Aplicar": this._totalAreaHa - this._workedArea,
      "Aplicado": this._workedArea,
    };
    return dataMap;
  }

  String getIconAssetForState() {
    if(this._workedArea == this._totalAreaHa) return "assets/green_ok.png";
    return "assets/purple_pause.png";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        height: 250,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Scaffold(
            backgroundColor: Colors.grey[200],
            body: Padding(
              padding: const EdgeInsets.fromLTRB(2, 10, 2, 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: PieChart(
                      dataMap: this.getDataMap(),
                      legendOptions: LegendOptions(showLegends: false),
                      chartValuesOptions: ChartValuesOptions(showChartValues: false),
                      colorList: [AppStyleValues.appSecondaryColor, AppStyleValues.appMainColor],
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: mainTitleStyle,
                            children: [
                              TextSpan(text: _farmName),
                              TextSpan(text: " - "),
                              TextSpan(text: _partName),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: _activityName,
                            style: secondaryTextStyle,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Área Total: $_totalAreaHa ha",
                            style: secondaryTextStyle,
                          ),
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            ColoredBox(
                              color: AppStyleValues.appMainColor,
                              child: SizedBox(
                                width: 20,
                                height: 20,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: "Área Aplicada: $_workedArea ha",
                                style: secondaryTextStyle,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            ColoredBox(
                              color: AppStyleValues.appSecondaryColor,
                              child: SizedBox(
                                width: 20,
                                height: 20,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: "Área Sem Aplicação: ${_totalAreaHa - _workedArea} ha",
                                style: secondaryTextStyle,
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        RichText(
                          text: TextSpan(
                            text: "Sobreaplicado: $_overWorked %",
                            style: secondaryTextStyle,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Velocidade média: $_avgSpeed km/h",
                            style: secondaryTextStyle,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            floatingActionButton: Image.asset(getIconAssetForState()),
          ),
        ),
      ),
    );
  }
}
