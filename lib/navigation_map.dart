import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:gps_tracker/database_files.dart';
import 'package:gps_tracker/style.dart';

class NavigationMap extends StatefulWidget {
  @override
  State createState() {
    return NavigationMapState();
  }
}

class NavigationMapState extends State<NavigationMap> {
  static NavigationMapState instance;

  @override
  void initState() {
    super.initState();
    instance = this;
  }

  void update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: CustomPaint(
        painter: MapPainter(),
        child: Container(),
      ),
    );
  }
}

class MapPainter extends CustomPainter {
  static Point position = Point(-55.53267, -23.26674);
  static double scale = 40000;
  static double angle = 0;

  static double initialScale = 0;
  static double initialAngle = 0;
  static Point initialPosition = Point(0, 0);
  static Offset initialFocalPoint;

  static void onScaleStart(ScaleStartDetails details) {
    initialAngle = angle;
    initialScale = scale;
    initialPosition = position;
    initialFocalPoint = details.focalPoint;
  }

  static void onScale(ScaleUpdateDetails details) {
    scale = min(max(initialScale * details.scale, 10000), 200000);
    angle = initialAngle + details.rotation;
    double dx = (details.focalPoint.dx - initialFocalPoint.dx) / scale;
    double dy = (details.focalPoint.dy - initialFocalPoint.dy) / scale;
    double rdx = dx * cos(angle) + dy * sin(angle);
    double rdy = -dx * sin(angle) + dy * cos(angle);
    position = Point(
      initialPosition.x - rdx,
      initialPosition.y + rdy,
    );
    if (NavigationMapState.instance != null) {
      NavigationMapState.instance.update();
    }
    if (details.pointerCount == 4) {
      position = Point(-55.53267, -23.26674);
      scale = 40000;
      angle = 0;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = AppStyleValues.appSecondaryColor;
    paint.style = PaintingStyle.stroke;
    Path cross = Path();
    cross.moveTo(0, -20);
    cross.lineTo(0, 20);
    cross.moveTo(-20, 0);
    cross.lineTo(20, 0);
    Path lines = Path();
    for (var n in ActivityData.nodes) {
      for (var p in n) {
        if (p == n.first) {
          lines.moveTo(p.long, p.lat);
          double earthRadiusMeters = 6371000;
          double horizontalEarthRadiusOnLatitude = earthRadiusMeters * cos(position.y * pi / 180);
          double meterToLong = (180 / (horizontalEarthRadiusOnLatitude * pi));
          double lineWidth = meterToLong * p.applyWidth;
          paint.strokeWidth = lineWidth;
        } else {
          lines.lineTo(p.long, p.lat);
        }
      }
    }
    //canvas.drawRect(Rect.fromLTWH(0,0, size.width, size.height), Paint()..color = Colors.white);
    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    Paint crossPaint = Paint();
    crossPaint.style = PaintingStyle.stroke;
    crossPaint.color = Colors.red;
    crossPaint.strokeWidth = 1;
    //canvas.drawPath(cross, crossPaint);
    canvas.rotate(angle);
    canvas.scale(scale);
    canvas.scale(1, -1);
    canvas.translate(-position.x, -position.y);
    canvas.drawPath(lines, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ActivityDataNode {
  int time;
  double lat;
  double long;
  double altitude;
  double applyWidth;

  ActivityDataNode(this.lat, this.long, {this.time, this.altitude, this.applyWidth});

  Map toJson() =>
      {'time': this.time, 'lat': this.lat, 'long': this.long, 'altitude': this.altitude, 'applyWidth': this.applyWidth};

  factory ActivityDataNode.fromJson(dynamic json) {
    return ActivityDataNode(json['lat'], json['long'], time: json['time'], altitude: json['altitude'], applyWidth: json['applyWidth']);
  }
}

class ActivityData {
  static List nodes = [];

  static void startNew() {
    nodes.add([]);
  }

  static void initialize() {
    startNew();
    FileDatabaseHandler db = new FileDatabaseHandler();
    db.createTable("tracks");
    db.readAllRows("tracks").then((rows) {
      if (rows.isEmpty) {
        ActivityData.nodes.last.add(ActivityDataNode(-23.26211, -55.52606, applyWidth: 18, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26234, -55.52633, applyWidth: 18, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26259, -55.52658, applyWidth: 18, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26321, -55.52723, applyWidth: 18, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26350, -55.52754, applyWidth: 18, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26369, -55.52774, applyWidth: 18, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26396, -55.52803, applyWidth: 18, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26421, -55.52826, applyWidth: 18, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26440, -55.52847, applyWidth: 18, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26479, -55.52889, applyWidth: 18, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26510, -55.52922, applyWidth: 2.5, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26542, -55.52957, applyWidth: 2.5, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26569, -55.52981, applyWidth: 2.5, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26583, -55.52999, applyWidth: 2.5, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26613, -55.53033, applyWidth: 2.5, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26657, -55.53077, applyWidth: 2.5, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26698, -55.53124, applyWidth: 2.5, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26741, -55.53166, applyWidth: 2.5, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26737, -55.53180, applyWidth: 2.5, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26711, -55.53207, applyWidth: 2.5, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26690, -55.53234, applyWidth: 2.5, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26675, -55.53262, applyWidth: 2.5, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26699, -55.53290, applyWidth: 2.5, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26728, -55.53318, applyWidth: 2.5, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26754, -55.53345, applyWidth: 2.5, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26777, -55.53370, applyWidth: 2.5, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26814, -55.53409, applyWidth: 2.5, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26815, -55.53426, applyWidth: 2.5, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26797, -55.53451, applyWidth: 2.5, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26774, -55.53475, applyWidth: 2.5, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26750, -55.53498, applyWidth: 2.5, altitude: 500, time: 0));
        ActivityData.nodes.last.add(ActivityDataNode(-23.26730, -55.53523, applyWidth: 2.5, altitude: 500, time: 0));
        rows['init-test'] = ActivityData.nodes.last;
        var rowJsonText = jsonEncode(rows['init-test']);
        db.writeRow('tracks', 'init-test', rowJsonText);
      } else {
        rows.forEach((key, value) {
          List<ActivityDataNode> nodes = (value as List).map((n) => ActivityDataNode.fromJson(n)).toList();
          ActivityData.nodes.add(nodes);
        });
      }
    });
    startNew();
  }
}

class GPSTracker {

  static List<Timer> timers = [];

  static void initialize() {
    FlutterBlue flutterBlue = FlutterBlue.instance; // Start scanning

    flutterBlue.startScan(timeout: Duration(seconds: 4));
    // Listen to scan results
    flutterBlue.scanResults.listen((results) {
      for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
        if (r.device.name == "GeoFarm GPS") {
          print("Connecting!!!");
          flutterBlue.stopScan();
          timers.forEach((element) {element.cancel();});
          r.device.connect(timeout: Duration(seconds: 4), autoConnect: true);
          var timer = Timer.periodic(Duration(milliseconds: 300), run);
          timers.add(timer);
        }
      }
    });
  }

  static Future<void> run(Timer timer) async {
    FlutterBlue flutterBlue = FlutterBlue.instance; // Start scanning
    var devices = await flutterBlue.connectedDevices;
    for (var device in devices) {
      if (device.name == "GeoFarm GPS") {
        var services = await device.discoverServices();
        services.forEach((service) async {
          var characteristics = service.characteristics;
          for (BluetoothCharacteristic c in characteristics) {
            if (c.uuid == Guid("96269f2b-d2c9-42f7-b169-f598830ad52f")) {
              List<int> dataRaw = await c.read();
              String dataString = String.fromCharCodes(dataRaw);
              Map<String, dynamic> data = jsonDecode(dataString);
              ActivityDataNode node = ActivityDataNode(
                data["latitude"],
                data["longitude"],
                time: DateTime.now().millisecondsSinceEpoch,
                altitude: data["altitude"],
                applyWidth: 2.5,
              );
              ActivityData.nodes.last.add(node);
              var date = DateTime.now();
              FileDatabaseHandler().writeRow('tracks', 'gps-track-${date.year}-${date.month}-${date.day}', jsonEncode(ActivityData.nodes.last));
            }
          }
        });
      }
    }
  }
}
