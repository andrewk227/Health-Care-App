import 'dart:math';

import 'package:permission_handler/permission_handler.dart';
import 'package:another_telephony/telephony.dart';
import 'package:android_intent_plus/android_intent.dart';

class HomeViewModel {
  String warningText =
      'You haven’t checked out the app recently.\nDo some workouts.';
  String warningIcon = 'warning.svg';

  int heartRate = 80;
  String mobileNum = "01288857086";
  final _telephony = Telephony.instance;

  void updateHeartRate() {
    heartRate = Random().nextInt(100) + 60;
  }

  void checkHeartRate(int heartRate) {
    if (heartRate > 120 || heartRate < 60) {
      triggerEmergency();
    }
  }

  void triggerEmergency() {
    makePhoneCall(mobileNum);
    sendSMS(mobileNum, "Emergency! Please help!");
  }

  Future<bool> requestCallPermission() async {
    final status = await Permission.phone.request();
    return status.isGranted;
  }

  void makePhoneCall(String phoneNumber) async {
    final hasPermission = await requestCallPermission();
    if (hasPermission) {
      final intent = AndroidIntent(
        action: 'android.intent.action.CALL',
        data: 'tel:$phoneNumber',
      );
      await intent.launch();
    } else {
      print("Phone call permission denied");
    }
  }

  Future<bool> requestSmsPermission() async {
    final status = await Permission.sms.request();
    return status.isGranted;
  }

  void sendSMS(String phoneNumber, String message) async {
    final hasPermission = await requestSmsPermission();
    if (hasPermission) {
      _telephony.sendSms(
        to: phoneNumber,
        message: message,
      );
    } else {
      print("SMS permission failed");
    }
  }
}
