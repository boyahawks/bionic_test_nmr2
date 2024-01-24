import 'package:bionic2/helper/local_storage.dart';

class AppData {
  // BOOL

  // static set statusAbsensi(bool value) =>
  //     LocalStorage.saveToDisk('statusAbsensi', value);

  // static bool get statusAbsensi {
  //   if (LocalStorage.getFromDisk('statusAbsensi') != null) {
  //     return LocalStorage.getFromDisk('statusAbsensi');
  //   }
  //   return false;
  // }

  // STRING

  static set email(String value) => LocalStorage.saveToDisk('email', value);

  static String get email {
    if (LocalStorage.getFromDisk('email') != null) {
      return LocalStorage.getFromDisk('email');
    }
    return "";
  }

  static set uuid(String value) => LocalStorage.saveToDisk('uuid', value);

  static String get uuid {
    if (LocalStorage.getFromDisk('uuid') != null) {
      return LocalStorage.getFromDisk('uuid');
    }
    return "";
  }

  // LIST

  // static set informasiUser(List<InformasiUserModel>? value) {
  //   if (value != null) {
  //     List<String> listString = value.map((e) => e.toJson()).toList();
  //     LocalStorage.saveToDisk('informasiUser', listString);
  //   } else {
  //     LocalStorage.saveToDisk('informasiUser', null);
  //   }
  // }

  // static List<InformasiUserModel>? get informasiUser {
  //   if (LocalStorage.getFromDisk('informasiUser') != null) {
  //     List<String> listData = LocalStorage.getFromDisk('informasiUser');
  //     return listData
  //         .map((e) => InformasiUserModel.fromMap(jsonDecode(e)))
  //         .toList();
  //   }
  //   return null;
  // }

  // CLEAR ALL DATA

  static void clearAllData() =>
      LocalStorage.removeFromDisk(null, clearAll: true);
}
