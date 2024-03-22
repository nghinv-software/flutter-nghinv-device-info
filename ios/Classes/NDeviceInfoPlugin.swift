import Flutter
import UIKit

public class NDeviceInfoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "n_device_info", binaryMessenger: registrar.messenger())
    let instance = NDeviceInfoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "getDeviceInfo") {
      let device = UIDevice.current
      let info: [String: Any] = [
        "id": device.identifierForVendor?.uuidString,
        "name": device.name,
        "isSimulator": device.name.contains("Simulator"),
        "version": device.systemVersion,
        "buildVersion": Bundle.main.infoDictionary?["CFBundleVersion"] as? String,
        "model": device.model,
        "manufacturer": "Apple",
        "os": "iOS",
        "osVersion": device.systemVersion,
        "userAgent": "iOS"
      ]

      result(info)
    } else {
      result(FlutterMethodNotImplemented)
    }
  }
}
