import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'model.dart';
import 'nghinv_device_info_method_channel.dart';

abstract class NDeviceInfoPlatform extends PlatformInterface {
  NDeviceInfoPlatform() : super(token: _token);

  static final Object _token = Object();

  static NDeviceInfoPlatform _instance = MethodChannelNDeviceInfo();

  static NDeviceInfoPlatform get instance => _instance;

  static set instance(NDeviceInfoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<NDeviceInfoModel?> getDeviceInfo() {
    throw UnimplementedError('getDeviceInfo() has not been implemented.');
  }
}
