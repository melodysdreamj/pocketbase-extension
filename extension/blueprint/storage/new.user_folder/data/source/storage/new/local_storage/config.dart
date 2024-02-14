import '../../../../../../../../util/handler/file_managing/_.dart';

class NewLocalStorageConfig {
  static Future<String> localPath() async {
    return "${await FileManagingKit().appPath()}/NewStorage";
  }
}
