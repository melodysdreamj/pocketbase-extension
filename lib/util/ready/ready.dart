import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get_storage/get_storage.dart';

import '../../../main.dart';
import '../start_app.dart';
import 'get_storage/ready.dart';
import 'logger/ready.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

readyForRunAppStart() async {
  if (_readyForRunAppStart) return;
  _readyForRunAppStart = true;
  setUrlStrategy(PathUrlStrategy());

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await readyForGetStorage();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await readyForLogger();

  // await readyObserver();
}

readyForMaterialAppStart() async {
  if (_readyForMaterialAppStart) return;
  _readyForMaterialAppStart = true;

  screenRotateConfig();
}

// readyForAppStart(BuildContext context) async {
//   if (_readyForAppStart) return;
//   _readyForAppStart = true;
//
//   // await MyPromiseAllSpell().returnVoid([
//   //   readyForFirebaseMessaging()
//   // ]);
// }

bool _readyForRunAppStart = false;
bool _readyForMaterialAppStart = false;
// bool _readyForAppStart = false;
