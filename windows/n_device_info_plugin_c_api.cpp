#include "include/n_device_info/n_device_info_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "n_device_info_plugin.h"

void NDeviceInfoPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  n_device_info::NDeviceInfoPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
