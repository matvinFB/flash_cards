import 'dart:math';

import 'package:flash_app/models/gesture.model.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../repositories/auth_repo/auth.repo.dart';

class SupabaseService {
  static Future<int?> insertGesture(Gesture gesture, String deviceID) async {
    final SupabaseClient supabase = GetIt.I.get<SupabaseClient>();
    AuthRepo authRepo = GetIt.I.get<AuthRepo>();
    final List<Map<String, dynamic>> gestureResponse;
    try {
      gestureResponse = await supabase.from('Gesture').insert([
        {
          'device_id': deviceID,
          'gesture_start': gesture.start.toIso8601String(),
          'gesture_end': gesture.end.toIso8601String(),
          'user_id': authRepo.user?.id ?? ""
        }
      ]).select();
    } catch (e) {
      print(e);
      return null;
    }

    if (gestureResponse.isEmpty) return null;

    return gestureResponse.first['id'];
  }

  static Future<void> insertPoints(
      List<Point> trajectory, int gestureID) async {
    final SupabaseClient supabase = GetIt.I.get<SupabaseClient>();
    try {
      await supabase.from('Points').insert(trajectory
          .map((e) => {
                'gestureID': gestureID,
                'x_coordinate': e.x,
                'y_coordinate': e.y
              })
          .toList());
    } catch (e) {
      print(e);
    }
  }

  static Future<AuthResponse?> login(
      {required String email, required String password}) async {
    final SupabaseClient supabase = GetIt.I.get<SupabaseClient>();
    AuthResponse response;
    try {
      response = await supabase.auth
          .signInWithPassword(email: email, password: password);
    } catch (e) {
      return null;
    }

    return response;
  }

  static Future<void> logout() async {
    final SupabaseClient supabase = GetIt.I.get<SupabaseClient>();
    try {
      await supabase.auth.signOut();
    } catch (e) {
      return;
    }

    return;
  }
}
