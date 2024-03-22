import 'dart:html' as html show window;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'model.dart';
import 'nghinv_device_info_platform_interface.dart';

class NDeviceInfoWeb extends NDeviceInfoPlatform {
  NDeviceInfoWeb();

  static void registerWith(Registrar registrar) {
    NDeviceInfoPlatform.instance = NDeviceInfoWeb();
  }

  @override
  Future<NDeviceInfoModel?> getDeviceInfo() async {
    final idOfClient = html.window.navigator.userAgent;
    return NDeviceInfoModel(
      id: idOfClient,
      name: html.window.navigator.appName,
      os: html.window.navigator.platform,
      version: html.window.navigator.appVersion,
      osVersion: html.window.navigator.platform,
      model: html.window.navigator.vendor,
      manufacturer: html.window.navigator.vendor,
      buildVersion: html.window.navigator.appVersion,
      isSimulator: false,
      userAgent: html.window.navigator.userAgent,
    );
  }
}
