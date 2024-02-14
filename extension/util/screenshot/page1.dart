import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';

class ScreenShotPage1 extends StatefulWidget {
  const ScreenShotPage1({super.key});

  @override
  State<ScreenShotPage1> createState() => _ScreenShotPage1State();
}

class _ScreenShotPage1State extends State<ScreenShotPage1> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: material.TextDirection.ltr,
      child: Material(
        child: SafeArea(
            child: Scaffold(
          body: Center(
            child: Text('${tr('hello world')} Page1'),
          ),
        )),
      ),
    );
  }
}
