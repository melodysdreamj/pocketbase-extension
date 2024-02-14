import 'package:flutter/material.dart';

import '../../../../../../../../util/start_app.dart';
import '_/component/util/view_skeleton.dart';

void NewToast(BuildContext context) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Material(
          color: Colors.transparent,
          child: NewView(
            params: NewParams(),
            tag: "newtag",
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}
