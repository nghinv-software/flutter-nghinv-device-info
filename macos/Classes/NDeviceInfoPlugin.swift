import Cocoa
import FlutterMacOS
import Foundation

public class NDeviceInfoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "n_device_info", binaryMessenger: registrar.messenger)
    let instance = NDeviceInfoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
      case "getDeviceInfo":
        let processInfo = ProcessInfo.processInfo
        let hostName = Host.current().localizedName ?? "Unknown"
        let info: [String: Any] = [
            "id": processInfo.processIdentifier,
            "name": hostName,
            "isSimulator": hostName.contains("Simulator"),
            "version": processInfo.operatingSystemVersionString,
            "buildVersion": Bundle.main.infoDictionary?["CFBundleVersion"] as? String as Any,
            "model": "Mac",
            "manufacturer": "Apple",
            "os": "macOS",
            "osVersion": processInfo.operatingSystemVersionString,
            "userAgent": "macOS"
          ]
        result(info)
      default:
        result(FlutterMethodNotImplemented)
      }
  }
}
