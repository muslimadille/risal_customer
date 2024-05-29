
import 'package:hive/hive.dart';

class HiveHelper {
  Future<bool> isExists({required String boxName}) async {
    final openBox = await Hive.openBox(boxName);
    int length = openBox.length;
    return length != 0;
  }
  addBoxes<T>(Object model, String boxName) async {
    print("adding boxes");
    final openBox = await Hive.openBox(boxName);
      openBox.add(model);
  }
  deleteBoxes<T>(String boxName) async {
    print("adding boxes");
    bool isExist=await Hive.boxExists(boxName);
    if(isExist){
      await Hive.deleteBoxFromDisk(boxName);
    }
  }

  getBoxes<T>(String boxName) async {
    final openBox = await Hive.openBox(boxName);
    return openBox.getAt(0) as T;
  }
  initAdaptors(){


  }

}