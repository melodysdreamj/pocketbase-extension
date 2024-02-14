import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../config/di.dart';
import '../config/params.dart';
import '../cycle/ready_view.dart';
import 'view_skeleton.dart';

export '../config/params.dart';

class NewNavigator {
  NewParams params;
  String? tag;

  NewNavigator(this.params, {this.tag}) {
    dependencyInjection(params, tag);
  }

  // page move with delay (hero animation available)
  Future<void> movePage(BuildContext context,
      {Transition? transition, Key? heroKey}) async {
    params.context = context;
    context.loaderOverlay.show(
      widgetBuilder: (progress) {
        return Container();
      },
    );
    if (!await readyView(params, context, tag)) {
      context.loaderOverlay.hide();
      return;
    }
    context.loaderOverlay.hide();
    Get.to(
        () => NewViewDoNotPutViewAsWidget(
              params: params,
              tag: tag,
              heroKey: heroKey,
              readyDone: true,
            ),
        transition: transition ?? Transition.rightToLeft);
  }

  Future<void> movePageOff(BuildContext context,
      {Transition? transition, Key? heroKey}) async {
    params.context = context;
    context.loaderOverlay.show(
      widgetBuilder: (progress) {
        return Container();
      },
    );
    if (!await readyView(params, context, tag)) {
      context.loaderOverlay.hide();
      return;
    }
    context.loaderOverlay.hide();
    Get.off(
        () => NewViewDoNotPutViewAsWidget(
              params: params,
              tag: tag,
              heroKey: heroKey,
              readyDone: true,
            ),
        transition: transition ?? Transition.rightToLeft);
  }

  Future<void> movePageOffAll(BuildContext context,
      {Transition? transition, Key? heroKey}) async {
    params.context = context;
    context.loaderOverlay.show(
      widgetBuilder: (progress) {
        return Container();
      },
    );
    if (!await readyView(params, context, tag)) {
      context.loaderOverlay.hide();
      return;
    }
    context.loaderOverlay.hide();
    Get.offAll(
        () => NewViewDoNotPutViewAsWidget(
              params: params,
              tag: tag,
              heroKey: heroKey,
              readyDone: true,
            ),
        transition: transition ?? Transition.rightToLeft);
  }

  // page move without delay (hero animation not available)
  movePageWithLoadingView(BuildContext context,
      {Transition? transition, Key? heroKey}) {
    params.context = context;
    Get.to(
        () => NewViewDoNotPutViewAsWidget(
              params: params,
              tag: tag,
              heroKey: heroKey,
            ),
        transition: transition ?? Transition.rightToLeft);
  }

  movePageOffWithLoadingView(BuildContext context,
      {Transition? transition, Key? heroKey}) {
    params.context = context;
    Get.off(
        () => NewViewDoNotPutViewAsWidget(
              params: params,
              tag: tag,
              heroKey: heroKey,
            ),
        transition: transition ?? Transition.rightToLeft);
  }

  movePageOffAllWithLoadingView(BuildContext context,
      {Transition? transition, Key? heroKey}) {
    params.context = context;
    Get.offAll(
        () => NewViewDoNotPutViewAsWidget(
              params: params,
              tag: tag,
              heroKey: heroKey,
            ),
        transition: transition ?? Transition.rightToLeft);
  }
}
