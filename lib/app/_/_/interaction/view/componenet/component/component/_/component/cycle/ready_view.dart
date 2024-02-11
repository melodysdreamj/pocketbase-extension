import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';

import '../../vm/action/ready_vm.dart';
import '../config/params.dart';
import '../util/view_skeleton.dart';

Future<void> readyView(
  NewParams params,
  BuildContext context,
  String? tag,
) async {
  await readyVMAction(context, params, tag: tag);
}
