import 'package:bionic2/modules/dashboard/dashboard.dart';
import 'package:bionic2/modules/maplocation/maplocation.dart';
import 'package:get/get.dart';
import 'package:bionic2/modules/auth/auth.dart';

class Routes {
  static routeTo({required String type, dynamic data}) {
    if (type == "login") {
      Get.to(
        const LoginView(),
        duration: const Duration(milliseconds: 300),
        transition: Transition.rightToLeftWithFade,
      );
    } else if (type == "registrasi") {
      Get.to(
        const RegistrasiView(),
        duration: const Duration(milliseconds: 300),
        transition: Transition.rightToLeftWithFade,
      );
    } else if (type == "mapslocation") {
      Get.to(
        const MapLocationView(),
        duration: const Duration(milliseconds: 300),
        transition: Transition.rightToLeftWithFade,
      );
    }
  }

  static routeOff({required String type, dynamic data}) {
    if (type == "dashboard") {
      Get.offAll(
        const DashboardScreen(),
        duration: const Duration(milliseconds: 300),
        transition: Transition.leftToRightWithFade,
      );
    }
  }
}
