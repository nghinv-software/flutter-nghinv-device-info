# nghinv_device_info

A new Flutter plugin project for get device info.

## Getting Started

```sh
flutter pub add nghinv_device_info
```

## Usage

```dart
import 'package:nghinv_device_info/nghinv_device_info.dart';

void main() async {
  final deviceInfo = await NDeviceInfo().getDeviceInfo();
  print('Device info: $deviceInfo');
}

## Properties

- `id`: Device id.
- `name`: Device name.
- `isSimulator`: Check device is simulator.
- `version`: App version.
- `buildVersion`: App build version.
- `model`: Device model.
- `manufacturer`: Device manufacturer.
- `os`: Device os.
- `osVersion`: Device os version.
- `userAgent`: Device user agent.

