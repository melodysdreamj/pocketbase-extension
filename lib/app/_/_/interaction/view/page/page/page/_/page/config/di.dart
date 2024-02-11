import '../../vm/util.dart';
import 'params.dart';

dependencyInjection(NewParams params, String? tag) {
  NewVMUtil.registeredVM(params, tag: tag);
}
