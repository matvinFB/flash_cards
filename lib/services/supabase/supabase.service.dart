
import 'dart:math';

import 'package:flash_app/models/gesture.model.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static Future<int?> insertGesture(Gesture gesture, String deviceID) async {
    final SupabaseClient supabase = GetIt.I.get<SupabaseClient>();
    final List<Map<String, dynamic>> gestureResponse =
        await supabase.from('Gesture').insert([
      {
        'device_id': deviceID,
        'gesture_start': gesture.start.toIso8601String(),
        'gesture_end': gesture.end.toIso8601String(),

      }
    ]).select();

    if (gestureResponse.isEmpty) return null;

    return gestureResponse.first['id'];
  }

  static insertPoints(List<Point> trajectory, int gestureID) async{
    final SupabaseClient supabase = GetIt.I.get<SupabaseClient>();

    final ans = await supabase.from('Points').insert(trajectory
        .map((e) =>
            {'gestureID': gestureID, 'x_coordinate': e.x, 'y_coordinate': e.y})
        .toList());
  }
}
