part of "./auth.dart";

class AuthController extends GetxController {
  var name = TextEditingController().obs;
  var email = TextEditingController().obs;
  var password = TextEditingController().obs;

  var checkedRemember = false.obs;
  var showPassword = false.obs;
  var showPasswordConfirm = false.obs;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> validasiRegistrasi() async {
    UtilsAlert.loadingSimpanData(context: Get.context!, text: "Loading...");
    try {
      var userCredential = firebaseAuth
        ..createUserWithEmailAndPassword(
            email: email.value.text, password: password.value.text);
      print("hasil credential $userCredential");
      var uuidUser = userCredential.currentUser?.uid;
      var emailUser = userCredential.currentUser?.email;
      if (uuidUser != "" && emailUser != "") {
        Get.back();
        Get.back();
        UtilsAlert.showToast("Akun berhasil registrasi");
        email.value.text = "";
        password.value.text = "";
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      UtilsAlert.showToast(e);
    }
  }

  Future<void> validasiLogin() async {
    UtilsAlert.loadingSimpanData(context: Get.context!, text: "Loading");
    try {
      var credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email.value.text, password: password.value.text);
      var uuid = credential.user!.uid;
      if (uuid != "") {
        AppData.email = email.value.text;
        AppData.uuid = uuid;
        Get.back();
        UtilsAlert.showToast("Account login successfully");
        DashboardController controllerDashboard =
            Get.find<DashboardController>();
        controllerDashboard.initData();
        Routes.routeOff(type: "dashboard");
        email.value.text = "";
        password.value.text = "";
      }
    } on FirebaseAuthException catch (e) {
      if (e.credential == null && e.code != "invalid-credential") {
        UtilsAlert.showToast("Anda belum terdaftar");
      } else {
        UtilsAlert.showToast("Kombinasi Email dan Password salah !");
      }
      Get.back();
    }
  }
}
