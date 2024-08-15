import 'package:nghinv_device_info/model.dart';

import 'nghinv_device_info_platform_interface.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';
import 'package:win32_registry/win32_registry.dart';

class NDeviceInfoPluginCApi extends NDeviceInfoPlatform {
  NDeviceInfoPluginCApi();

  static void registerWith() {
    NDeviceInfoPlatform.instance = NDeviceInfoPluginCApi();
  }

  @override
  Future<NDeviceInfoModel?> getDeviceInfo() {
    final systemInfo = calloc<SYSTEM_INFO>();
    final osVersionInfo = calloc<OSVERSIONINFOEX>()
      ..ref.dwOSVersionInfoSize = sizeOf<OSVERSIONINFOEX>();

    try {
      final currentVersionKey = Registry.openPath(RegistryHive.localMachine,
          path: r'SOFTWARE\Microsoft\Windows NT\CurrentVersion');
      final buildLab = currentVersionKey.getValueAsString('BuildLab') ?? '';
      currentVersionKey.getValue('DigitalProductId');
      final displayVersion =
          currentVersionKey.getValueAsString('DisplayVersion') ?? '';
      final editionId = currentVersionKey.getValueAsString('EditionID') ?? '';
      var productName = currentVersionKey.getValueAsString('ProductName') ?? '';
      final registeredOwner =
          currentVersionKey.getValueAsString('RegisteredOwner') ?? '';
      final releaseId = currentVersionKey.getValueAsString('ReleaseId') ?? '';

      final sqmClientKey = Registry.openPath(RegistryHive.localMachine,
          path: r'SOFTWARE\Microsoft\SQMClient');
      final machineId = sqmClientKey.getValueAsString('MachineId') ?? '';

      currentVersionKey.close();
      sqmClientKey.close();

      return Future.value(
        NDeviceInfoModel(
          id: machineId,
          name: productName,
          version: displayVersion,
          isSimulator: false,
          buildVersion: buildLab,
          model: editionId,
          manufacturer: registeredOwner,
          os: 'windows',
          osVersion: releaseId,
          userAgent: 'windows',
        ),
      );
    } catch (e) {
      return Future.value(
        NDeviceInfoModel(
          id: 'unknown',
          name: 'windows',
          version: 'unknown',
          isSimulator: false,
          buildVersion: 'unknown',
          model: 'windows',
          manufacturer: 'unknown',
          os: 'windows',
          osVersion: 'unknown',
          userAgent: 'windows',
        ),
      );
    } finally {
      calloc.free(systemInfo);
      calloc.free(osVersionInfo);
    }
  }
}
