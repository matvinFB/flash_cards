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



  void finishGesture(DateTime endTime, Offset offset) {
    currentGesture?.addPoint(Point(offset.dx, offset.dy));
    currentGesture?.addEndTime(endTime);

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
