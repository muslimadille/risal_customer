
import 'package:hive/hive.dart';
import 'package:risal_customer/common/utils/app_data.dart';

import 'device_info_details.dart';

class LocalStorage {
  static LocalStorage? _instance;

  LocalStorage._internal();

  factory LocalStorage() {
    return _instance ??= LocalStorage._internal();
  }

  late final Box _box;

  Future<void> init() async {
    String path = DeviceInfoDetails().securePath.path;
    Hive.init(path);
    _box = await Hive.openBox(AppData.LOCAL_BOX_NAME);
  }

  void putInBox({required String key, required dynamic value}) {
    _box.put(key, value);
  }

  getFromBox({required String key}) {
    return _box.get(key, defaultValue: null);
  }

  void deleteFromBox({required String key}) {
    _box.delete(key);
  }
}
