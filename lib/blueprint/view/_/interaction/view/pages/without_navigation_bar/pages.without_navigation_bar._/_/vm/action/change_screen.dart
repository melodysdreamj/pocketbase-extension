import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../util.dart';
import '../vm.dart';

changeScreenAction(int screenIndex, {String? tag}) {
  NewVM viewModel = NewVMUtil.vm(tag: tag);

  viewModel.selectedIndex = screenIndex;

  viewModel.util.notify();
}
