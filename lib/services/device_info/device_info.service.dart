import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

class DeviceInfo {
  /// Retrieves the unique device ID for Android and iOS devices.
  ///
  /// Returns the device ID as a [String] or `null` if the ID cannot be retrieved.
  static Future<String?> getUniqueDeviceID() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      return (await deviceInfo.androidInfo).id;
    } else if (Platform.isIOS) {
      return (await deviceInfo.iosInfo).identifierForVendor;
    }
    return null;
  }
}