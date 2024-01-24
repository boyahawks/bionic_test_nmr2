part of "./auth.dart";

class RegistrasiView extends StatefulWidget {
  const RegistrasiView({super.key});

  @override
  RegistrasiViewState createState() => RegistrasiViewState();
}

class RegistrasiViewState extends State<RegistrasiView> {
  AuthController controller = Get.put(AuthController());

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        type: "default",
        colorBackground: Utility.baseColor2,
        returnOnWillpop: false,
        colorSafeArea: Utility.baseColor2,
        backFunction: () => Get.back(),
        content: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.center,
                    image: AssetImage('assets/bg_main.png'),
                    fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Utility.medium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => hideKeyboard(context),
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Utility.extraLarge + Utility.extraLarge,
                            ),
                            Center(
                              child: TextLabel(
                                text: "Registrasi",
                                color: Utility.baseColor1,
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              height: Utility.extraLarge + Utility.extraLarge,
                            ),
                            _emailScreen(),
                            SizedBox(
                              height: Utility.medium,
                            ),
                            _passwordScreen(),
                            SizedBox(
                              height: Utility.extraLarge + Utility.extraLarge,
                            ),
                            _buttonRegistrasi(context),
                            SizedBox(
                              height: Utility.medium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget _emailScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextLabel(
          text: "Email",
          color: Utility.baseColor1,
        ),
        SizedBox(
          height: Utility.normal,
        ),
        TextFieldMain(
          controller: controller.email.value,
          borderRadius: Utility.borderStyle3,
          colorRadius: Utility.baseColor1,
          colorRadiusFocus: Utility.baseColor1,
          colorCursor: Utility.baseColor1,
          verticalPadContent: 20.0,
          horizontalPadContent: 20.0,
          colorTextField: Utility.baseColor1,
          validator: (value) {
            return Validator.required(value, "Required email");
          },
        ),
      ],
    );
  }

  Widget _passwordScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextLabel(
          text: "Password",
          color: Utility.baseColor1,
        ),
        SizedBox(
          height: Utility.normal,
        ),
        Obx(
          () => TextFieldPassword(
            controller: controller.password.value,
            statusCardCustom: true,
            colorCursor: Utility.baseColor1,
            colorCard: Utility.baseColor1,
            borderRadius: Utility.borderStyle2,
            colorRadius: Utility.baseColor1,
            colorRadiusFocus: Utility.baseColor1,
            obscureColorIconEnable: Utility.baseColor1,
            obscureColorIconDisable: Utility.baseColor1,
            verticalPadContent: 20.0,
            horizontalPadContent: 20.0,
            colorTextField: Utility.baseColor1,
            validator: (value) {
              return Validator.required(value, "Required password");
            },
            obscureController: controller.showPassword.value,
            onTap: () {
              controller.showPassword.value = !controller.showPassword.value;
              controller.showPassword.refresh();
            },
          ),
        ),
      ],
    );
  }

  Widget _buttonRegistrasi(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Button1(
            colorBtn: Utility.baseColor1,
            radius: 30.0,
            contentButton: Padding(
              padding: const EdgeInsets.only(left: 100.0, right: 100.0),
              child: Center(
                  child: TextLabel(
                text: "Sign Up",
                weigh: FontWeight.bold,
                color: Utility.baseColor2,
              )),
            ),
            onTap: () {
              if (!formKey.currentState!.validate()) {
                hideKeyboard(context);
                return;
              } else {
                controller.validasiRegistrasi();
              }
            })
      ],
    );
  }
}
