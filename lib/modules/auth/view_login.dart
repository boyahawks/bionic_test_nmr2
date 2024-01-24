part of "./auth.dart";

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
                                text: "Login",
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
                            InkWell(
                              onTap: () async {
                                controller.email.value.text = "";
                                controller.password.value.text = "";
                                Routes.routeTo(type: "registrasi");
                              },
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: TextLabel(
                                  text: "Belum punya akun ?",
                                  color: Utility.baseColor1,
                                  weigh: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Utility.extraLarge + Utility.extraLarge,
                            ),
                            _buttonLogin(context),
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

  Widget _buttonLogin(BuildContext context) {
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
                text: "Sign In",
                weigh: FontWeight.bold,
                color: Utility.baseColor2,
              )),
            ),
            onTap: () {
              if (!formKey.currentState!.validate()) {
                hideKeyboard(context);
                return;
              } else {
                controller.validasiLogin();
              }
            })
      ],
    );
  }

  Widget _screenRemember() {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.blue;
    }

    return Obx(
      () => ExpandedView2Row(
          flexLeft: 50,
          flexRight: 50,
          widgetLeft: ExpandedView2Row(
              flexLeft: 15,
              flexRight: 85,
              widgetLeft: Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: controller.checkedRemember.value,
                onChanged: (bool? value) {
                  controller.checkedRemember.value = value!;
                  controller.checkedRemember.refresh();
                },
              ),
              widgetRight: Padding(
                padding: EdgeInsets.only(
                    top: Utility.medium, left: Utility.verySmall),
                child: TextLabel(
                  text: "Remember",
                  color: Utility.baseColor1,
                ),
              )),
          widgetRight: Padding(
            padding: EdgeInsets.only(top: Utility.medium),
            child: TextLabel(
              text: "Lorem Ipsum ?",
              color: Utility.baseColor1,
              align: TextAlign.center,
            ),
          )),
    );
  }

  Widget _footer() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: TextLabel(
              text: "Lorem ipsum Lorem ipsum Lorem ipsum ?",
              color: Utility.baseColor1,
              size: Utility.medium,
              weigh: FontWeight.bold,
              align: TextAlign.center,
            ),
          ),
          InkWell(
            onTap: () {},
            child: TextLabel(
              text: "Lorem ipsum",
              color: Utility.baseColor1,
              size: Utility.medium,
              weigh: FontWeight.bold,
              align: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
