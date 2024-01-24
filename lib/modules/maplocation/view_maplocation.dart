part of "./maplocation.dart";

class MapLocationView extends StatefulWidget {
  const MapLocationView({super.key});

  @override
  State<MapLocationView> createState() => _MapLocationViewState();
}

class _MapLocationViewState extends State<MapLocationView> {
  MapsController controller = Get.put(MapsController());

  @override
  void initState() {
    controller.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MainScaffold(
        type: "default",
        colorBackground: Utility.baseColor2,
        returnOnWillpop: false,
        colorSafeArea: Utility.baseColor2,
        backFunction: () => Routes.routeOff(type: "dashboard"),
        content: GoogleMap(
          markers: Set.from(controller.markerPosition),
          onMapCreated: (GoogleMapController ct) {
            controller.mapController.complete(ct);
          },
          initialCameraPosition: controller.cameraPosition.value,
        ),
        floatingActionButton: Padding(
          padding:
              EdgeInsets.only(right: Utility.extraLarge + Utility.extraLarge),
          child: FloatingActionButton.extended(
            onPressed: () => controller.shareLokasi(),
            label: TextLabel(
              text: "Share",
              color: Utility.baseColor1,
            ),
            icon: Icon(
              Icons.share,
              color: Utility.baseColor1,
            ),
          ),
        ),
      ),
    );
  }
}
