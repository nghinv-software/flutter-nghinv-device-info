import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'model.dart';
import 'nghinv_device_info_platform_interface.dart';

class MethodChannelNDeviceInfo extends NDeviceInfoPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('n_device_info');

  @override
  Future<NDeviceInfoModel?> getDeviceInfo() async {
    try {
      final data = await methodChannel.invokeMethod('getDeviceInfo');

      if (data == null) {
        return null;
      }

      final mapData = Map<String, dynamic>.from(data as Map);
      return NDeviceInfoModel.fromJson(mapData);
    } catch (e) {
      return null;
    }
  }
}
