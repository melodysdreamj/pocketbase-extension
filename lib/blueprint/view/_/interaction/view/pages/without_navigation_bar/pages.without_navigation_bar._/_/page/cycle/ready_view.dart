import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';

import '../../vm/action/ready_vm.dart';
import '../config/params.dart';
import '../util/view_skeleton.dart';

Future<bool> readyView(
  NewParams params,
  BuildContext context,
  String? tag,
) async {
  await readyVMAction(context, params, tag: tag);

  // decision to open page or not, only available in movePage,movePageOff,movePageOffAll
  return true; // false to cancel open page
}
