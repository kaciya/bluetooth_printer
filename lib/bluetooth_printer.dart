import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

class BluetoothPrinter {
  static const MethodChannel _channel =
      const MethodChannel('bluetooth_printer');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future printOrderTicket(Map _orderInfo) async{
    await _channel.invokeMethod('printOrderTicket',{'orderJsonStr':json.encode(_orderInfo)});
    return;
  }
}