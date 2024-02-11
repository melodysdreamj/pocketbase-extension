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

  // page move without delay (hero animation not available)
  movePageWithLoadingView(BuildContext context,
      {Transition? transition, Key? heroKey}) {
    params.context = context;
    Get.to(
        () => NewView(
              params: params,
              tag: tag,
            ),
        transition: transition ?? Transition.noTransition);
  }

  movePageOffWithLoadingView(BuildContext context,
      {Transition? transition, Key? heroKey}) {
    params.context = context;
    Get.off(
        () => NewView(
              params: params,
              tag: tag,
            ),
        transition: transition ?? Transition.noTransition);
  }

  movePageOffAllWithLoadingView(BuildContext context,
      {Transition? transition, Key? heroKey}) {
    params.context = context;
    Get.offAll(
        () => NewView(
              params: params,
              tag: tag,
            ),
        transition: transition ?? Transition.noTransition);
  }

  // When using a router, interpret the param here and insert it as a query,
  // then in view_prepare_router.dart, interpret and reassemble it to complete the view.
  // Also, please register the page under 'getPages:'.
  moveUsingRouter({String? tag}) {
    if (tag == null) {
      Get.toNamed('/new');
    } else {
      Get.toNamed('/new?detail=$tag');
    }
  }
}
