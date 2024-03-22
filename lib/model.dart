class NDeviceInfoModel {
  final String id;
  final String name;
  final bool? isSimulator;
  final String? version;
  final String? buildVersion;
  final String? model;
  final String? manufacturer;
  final String? os;
  final String? osVersion;
  final String? userAgent;

  NDeviceInfoModel({
    required this.id,
    required this.name,
    required this.isSimulator,
    required this.version,
    required this.buildVersion,
    required this.model,
    required this.manufacturer,
    required this.os,
    required this.osVersion,
    required this.userAgent,
  });

  factory NDeviceInfoModel.fromJson(Map<String, dynamic> json) {
    return NDeviceInfoModel(
      id: json['id'],
      name: json['name'],
      isSimulator: json['isSimulator'],
      version: json['version'],
      buildVersion: json['buildVersion'],
      model: json['model'],
      manufacturer: json['manufacturer'],
      os: json['os'],
      osVersion: json['osVersion'],
      userAgent: json['userAgent'],
    );
  }
}
