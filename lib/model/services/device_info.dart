import 'package:network_info_plus/network_info_plus.dart';

class DeviceInfoApp {
  Future<String?> getInfoAppQr() async {
    String? wifiIP = await NetworkInfo().getWifiIP();
    return wifiIP;
  }
}
