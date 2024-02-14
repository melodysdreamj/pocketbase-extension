import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';

import '../../app/_/_/interaction/listener/_/app_life_cycle/when_open_app.dart';
import '../../../main.dart';
import '../start_app.dart';
import 'awesome_notifications/ready.dart';
import 'battery_plus/ready.dart';
import 'connectivity_plus/ready.dart';
import 'country_code/ready.dart';
import 'easy_localization/ready.dart';
import 'get_storage/ready.dart';
import 'google_mobile_ads/ready.dart';
import 'hive/ready.dart';
import 'logger/ready.dart';
import 'my_app_version_change/ready.dart';
import 'package_info/ready.dart';
import 'timeago/ready.dart';

readyForRunAppStart() async {
  if (_readyForRunAppStart) return;
  _readyForRunAppStart = true;

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await readyForGetStorage();

  await readyForEasyLocalization();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await readyForLogger();

  await readyForHive();
  await readyForCountryCodes();

  await readyForPackageInfo();
  await readyForTimeAgo();

  await readyForGoogleMobileAds();

  // await readyObserver();
}

readyForMaterialAppStart() async {
  if (_readyForMaterialAppStart) return;
  _readyForMaterialAppStart = true;

  screenRotateConfig();
}

readyForAppStart(BuildContext context) async {
  if (_readyForAppStart) return;
  _readyForAppStart = true;

  WhenOpenAppListener();
  await readyForBatteryPlus();
  await readyForConnectivityPlus();
  await readyForMyAppVersionChange();
  await readyForAwesomeNotifications();

  // await MyPromiseAllSpell().returnVoid([
  //   readyForFirebaseMessaging()
  // ]);
}

bool _readyForRunAppStart = false;
bool _readyForMaterialAppStart = false;
bool _readyForAppStart = false;
