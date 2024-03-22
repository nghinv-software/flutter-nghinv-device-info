library nghinv_device_info;

import 'model.dart';
import 'nghinv_device_info_platform_interface.dart';

class NDeviceInfo {
  Future<NDeviceInfoModel?> getDeviceInfo() {
    return NDeviceInfoPlatform.instance.getDeviceInfo();
  }
}
