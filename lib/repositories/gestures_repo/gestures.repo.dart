import 'dart:math';

import 'package:flash_app/models/gesture.model.dart';
import 'package:flutter/material.dart';

import '../../services/device_info/device_info.service.dart';
import '../../services/supabase/supabase.service.dart';


class GesturesRepository {
  Gesture? currentGesture;
  void startGesture(DateTime startTime, Offset offset) => currentGesture =
      Gesture(startPoint: Point(offset.dx, offset.dy), start: startTime);

  void addPointToGesture(Offset offset) =>
      currentGesture?.addPoint(Point(offset.dx, offset.dy));

//TODO REMOVE TEMP FUNCTIONS
  Point calcFinalVector(Point a, Point b) {
    double x = (b.x - a.x) as double;
    double y = (b.y - a.y) as double;

    return Point(x, y);
  }

  double calculateDistance(Point a, Point b) {
    double dx = (b.x - a.x) as double;
    double dy = (b.y - a.y) as double;

    // Using the distance formula: sqrt((x2 - x1)^2 + (y2 - y1)^2)
    double distance = sqrt(dx * dx + dy * dy);

    return distance;
  }

  double calculateTotalDistance(List<Point> points) {
    double totalDistance = 0.0;

    for (int i = 0; i < points.length - 1; i++) {
      Point currentPoint = points[i];
      Point nextPoint = points[i + 1];

      double distance = calculateDistance(currentPoint, nextPoint);
      totalDistance += distance;
    }

    return totalDistance;
  }

  void finishGesture(DateTime endTime, Offset offset) {
    //TODO ADD LOGIC TO SAVE GESTURE IN DB
    currentGesture?.addPoint(Point(offset.dx, offset.dy));
    currentGesture?.addEndTime(endTime);

    print("=========Gesture=========");
    print("Start Time: " + currentGesture!.start.toString());
    print("End Time: " + currentGesture!.end.toString());
    int timeMs =
        currentGesture!.end.difference(currentGesture!.start).inMilliseconds;
    print(
        "Total duration: ${currentGesture!.end.difference(currentGesture!.start).inMilliseconds} ms");
    Point temp = calcFinalVector(
      currentGesture!.trajectory.first,
      currentGesture!.trajectory.last,
    );
    print("Final vector (x, y): (${temp.x}, ${temp.y})");
    print("Final vector size: " +
        calculateDistance(
          currentGesture!.trajectory.first,
          currentGesture!.trajectory.last,
        ).toString());
    double totalDist = calculateTotalDistance(currentGesture!.trajectory);
    print("Total Gesture Size: $totalDist");
    print(
        "Média de Pixels por milissegundos: ${(totalDist / timeMs).toStringAsFixed(3)}");
    print("====================\n");

    _insertGesture(currentGesture!);

    currentGesture = null;
  }

  void _insertGesture(Gesture gesture) async {
    String deviceID = await DeviceInfo.getUniqueDeviceID() ?? '';

    int? gestureID = await SupabaseService.insertGesture(gesture, deviceID);
    if (gestureID == null) return;
    SupabaseService.insertPoints(gesture.trajectory, gestureID);
  }
}
