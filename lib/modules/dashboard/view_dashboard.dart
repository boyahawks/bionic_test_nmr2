part of "./dashboard.dart";

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DashboardController controller = Get.put(DashboardController());

  @override
  void initState() {
    controller.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      type: "default",
      colorBackground: Utility.baseColor2,
      colorSafeArea: Utility.baseColor2,
      returnOnWillpop: false,
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
                SizedBox(
                  height: Utility.large + Utility.large,
                ),
                controller.email.value.isEmpty
                    ? const SizedBox()
                    : Center(
                        child: TextLabel(
                          text: "Selamat Datang ${controller.email.value}",
                          size: Utility.large,
                          color: Utility.baseColor1,
                        ),
                      ),
                SizedBox(
                  height: Utility.large + Utility.large,
                ),
                Center(
                  child: TextLabel(
                    text: "Menu Test Bionic",
                    size: Utility.large,
                    color: Utility.baseColor1,
                  ),
                ),
                Flexible(
                  child: Container(
                    color: Colors.transparent,
                    child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(0),
                        itemCount: controller.listMenu.length,
                        controller: controller.controllerScroll,
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) {
                          int id = controller.listMenu[index]["id"];
                          String namaMenu = controller.listMenu[index]["nama"];
                          return Padding(
                            padding: EdgeInsets.all(Utility.medium),
                            child: InkWell(
                              onTap: () => controller.changePage(id),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: namaMenu == "Login"
                                      ? Icon(
                                          Iconsax.user4,
                                          color: Utility.baseColor1,
                                          size: Utility.extraLarge +
                                              Utility.extraLarge,
                                        )
                                      : namaMenu == "Map Lokasi"
                                          ? Icon(
                                              Iconsax.map5,
                                              color: Utility.baseColor1,
                                              size: Utility.extraLarge +
                                                  Utility.extraLarge,
                                            )
                                          : namaMenu == "Contact"
                                              ? Icon(
                                                  Icons.contact_page_outlined,
                                                  color: Utility.baseColor1,
                                                  size: Utility.extraLarge +
                                                      Utility.extraLarge,
                                                )
                                              : namaMenu == "Media"
                                                  ? Icon(
                                                      Icons.photo,
                                                      color: Utility.baseColor1,
                                                      size: Utility.extraLarge +
                                                          Utility.extraLarge,
                                                    )
                                                  : Icon(
                                                      Iconsax.document5,
                                                      color: Utility.baseColor1,
                                                      size: Utility.extraLarge +
                                                          Utility.extraLarge,
                                                    )),
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
