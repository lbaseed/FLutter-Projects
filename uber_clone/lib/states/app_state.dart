import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_clone/requests/google_maps_requests.dart';

class AppState with ChangeNotifier {
  static LatLng _initialPosition = LatLng(10.27, 11.17);
  LatLng _lastPosition = _initialPosition;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyLines = {};
  GoogleMapController? _mapController;
  GoogleMapsServices _googleMapsServices = GoogleMapsServices();
  TextEditingController locationController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  //getters
  LatLng get initialPosition => _initialPosition;
  LatLng get lastPosition => _lastPosition;
  GoogleMapsServices get googleMapsServices => _googleMapsServices;
  GoogleMapController? get mapController => _mapController;
  Set<Marker> get markers => _markers;
  Set<Polyline> get polyLines => _polyLines;

  AppState() {
    getUserLocation();
  }

//get user current location
  Future<void> getUserLocation() async {
    print("location checking");

    Position position = await Geolocator.getCurrentPosition(
        forceAndroidLocationManager: true,
        desiredAccuracy: LocationAccuracy.high);

    _initialPosition = LatLng(position.latitude, position.longitude);

    // List<Placemark> placemark =
    //     await placemarkFromCoordinates(position.latitude, position.longitude);

    // locationController.text = placemark[0].name.toString();
    print(
        "#####user location Lat ${position.latitude} and long ${position.longitude}");

    notifyListeners();
  }

  //to create route

  void _createRoute(String encodedPolyLine) {
    _polyLines.clear();
    _polyLines.add(
      Polyline(
          polylineId: PolylineId(_lastPosition.toString()),
          width: 10,
          points: _convertToLatLng(_decodePoly(encodedPolyLine)),
          color: Colors.blue),
    );

    notifyListeners();
  }

  // add marker to the map

  void _onAddMarker(LatLng location, String address) {
    _markers.add(
      Marker(
          markerId: MarkerId(_lastPosition.toString()),
          position: location,
          infoWindow: InfoWindow(title: address, snippet: "going here"),
          icon: BitmapDescriptor.defaultMarker),
    );
    notifyListeners();
  }

  //CONVERTING list of doubles into LatLng
  List<LatLng> _convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];

    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }

    return result;
  }

  // !DECODE POLY
  List _decodePoly(String poly) {
    var list = poly.codeUnits;
    List lList = [];
    int index = 0;
    int len = poly.length;
    int c = 0;
    // repeating until all attributes are decoded
    do {
      var shift = 0;
      int result = 0;

      // for decoding value of one attribute
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      /* if value is negetive then bitwise not the value */
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

    /*adding to previous value as done in encoding */
    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];

    return lList;
  }

  void sendRequest(String intendedLocation) async {
    List<Location> location =
        await locationFromAddress(intendedLocation + " gombe");
    double lat = location[0].latitude;
    double long = location[0].longitude;

    LatLng destination = LatLng(lat, long);

    print(destination);

    _onAddMarker(destination, intendedLocation);

    String route = await _googleMapsServices.getRouteCoordinates(
        _initialPosition, destination);

    _createRoute(route);

    // ignore: unnecessary_null_comparison
    destination != null
        ? _mapController?.moveCamera(CameraUpdate.newLatLng(destination))
        : _mapController?.moveCamera(CameraUpdate.newLatLng(_initialPosition));

    notifyListeners();
  }

//camera move
  void onCameraMove(CameraPosition position) async {
    _lastPosition = position.target;
    // print("last position $_lastPosition");
    notifyListeners();
  }

//on Create
  void onCreated(GoogleMapController controller) {
    _mapController = controller;
    notifyListeners();
  }
}
