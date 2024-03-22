#ifndef FLUTTER_PLUGIN_N_DEVICE_INFO_PLUGIN_H_
#define FLUTTER_PLUGIN_N_DEVICE_INFO_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace n_device_info {

class NDeviceInfoPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  NDeviceInfoPlugin();

  virtual ~NDeviceInfoPlugin();

  // Disallow copy and assign.
  NDeviceInfoPlugin(const NDeviceInfoPlugin&) = delete;
  NDeviceInfoPlugin& operator=(const NDeviceInfoPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace n_device_info

#endif  // FLUTTER_PLUGIN_N_DEVICE_INFO_PLUGIN_H_
