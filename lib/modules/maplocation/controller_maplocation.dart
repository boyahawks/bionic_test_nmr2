part of "./maplocation.dart";

class MapsController extends GetxController {
  Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  Rx<CameraPosition> cameraPosition = const CameraPosition(
    target: LatLng(-6.2293796, 106.6647054),
    zoom: 8.0,
  ).obs;

  RxSet<Marker> markerPosition = RxSet<Marker>();
  RxBool serviceEnabled = false.obs;
  RxDouble latUser = 0.0.obs;
  RxDouble longUser = 0.0.obs;

  Future<void> initData() async {
    loadLocation();
  }

  Future<void> loadLocation() async {
    Location location = Location();
    LocationData data = await location.getLocation();
    latUser.value = data.latitude ?? 0.0;
    latUser.refresh();
    longUser.value = data.longitude ?? 0.0;
    longUser.refresh;
    if (latUser.value != 0.0 && longUser.value != 0.0) {
      _addMarker();
    }
  }

  Future<void> shareLokasi() async {
    String urlShare =
        'https://www.google.com/maps/search/?api=1&query=${latUser.value},${longUser.value}';
    await Share.share(urlShare);
  }

  Future<void> _addMarker() async {
    markerPosition.add(Marker(
        markerId: const MarkerId("1"),
        position: LatLng(latUser.value, longUser.value),
        onTap: () {}));
  }
}
