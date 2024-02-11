import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import 'view_skeleton.dart';

class NewViewInRouter extends StatelessWidget {
  const NewViewInRouter({super.key});

  @override
  Widget build(BuildContext context) {
    // get url path parameter
    // final id = Get.parameters['id'];

    // get query parameter
    // final uri = Uri.base;
    // final id = uri.queryParameters['id'];

    return NewView(
      params: NewParams()..context = context,
    );
  }
}
