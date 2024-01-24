part of "./dashboard.dart";

class DashboardController extends GetxController {
  ScrollController controllerScroll = ScrollController();
  DateTime? currentBackPressTime;
  RxBool statusOnWillPop = false.obs;

  RxString email = "".obs;

  RxList<dynamic> listMenu = [].obs;

  List menuStatic = [
    {
      "id": 1,
      "nama": "Login",
    },
    {
      "id": 2,
      "nama": "Map Lokasi",
    },
    {
      "id": 3,
      "nama": "Contact",
    },
    {
      "id": 4,
      "nama": "Media",
    },
    {
      "id": 5,
      "nama": "Data Storage",
    }
  ];

  Future<void> initData() async {
    email.value = AppData.email;
    email.refresh();
    if (listMenu.isEmpty) {
      _loadMenu();
    }
  }

  Future<void> _loadMenu() async {
    for (var element in menuStatic) {
      listMenu.add(element);
    }
    listMenu.refresh();
  }

  Future<void> changePage(id) async {
    if (id == 1) {
      Routes.routeTo(type: "login");
    } else if (id == 2) {
      Location location = Location();
      PermissionStatus status = await location.hasPermission();
      if (status == PermissionStatus.denied) {
        status = await location.requestPermission();
      }
      if (status == PermissionStatus.deniedForever) {
        AppSettings.openAppSettings(type: AppSettingsType.settings);
      }
      Routes.routeTo(type: "mapslocation");
    }
  }

  Future<void> closeApp() async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      UtilsAlert.showToast("Press again to exit");
      statusOnWillPop.value = false;
      statusOnWillPop.refresh();
    } else {
      statusOnWillPop.value = true;
      statusOnWillPop.refresh();
    }
  }
}
