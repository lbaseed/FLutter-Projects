import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ryder/DataHandler/appData.dart';
import 'package:ryder/Models/address.dart';
import 'package:ryder/Models/models.dart';
import 'package:ryder/assistance/request_assistant.dart';
import 'package:ryder/configMaps.dart';

class AssistantMethods {
  static Future<String> searchCoordinateAddress(
      Position position, context) async {
    String placeAddress = "";
    String st1, st2, st3, st4;
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey";

    var response = await RequestAssistant.getRequest(url);

    if (response != "Failed") {
      placeAddress = response["results"][0]["formatted_address"];
      // st1 = response["results"][0]["address_components"][3]["long_name"];
      // st2 = response["results"][0]["address_components"][4]["long_name"];
      // st3 = response["results"][0]["address_components"][5]["long_name"];
      // st4 = response["results"][0]["address_components"][6]["long_name"];
      // placeAddress = st1 + ", " + st2 + ", " + st3 + ", " + st4;

      Address userPickUpAddress = new Address();
      userPickUpAddress.latitude = position.latitude;
      userPickUpAddress.longitude = position.longitude;
      userPickUpAddress.placeName = placeAddress;

      Provider.of<AppData>(context, listen: false)
          .updatePickUpLocationAddress(userPickUpAddress);
    }

    return placeAddress;
  }

  static Future<DirectionDetails> obtainPlaceDirectionDetails(
      LatLng initialPosition, LatLng finalPosition) async {
    DirectionDetails directionDetails = DirectionDetails();
    String directionUrl =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${initialPosition.latitude},${initialPosition.longitude}&destination=${finalPosition.latitude},${finalPosition.longitude}&key=$mapKey";

    var res = await RequestAssistant.getRequest(directionUrl);

    if (res == "Failed") {
      return directionDetails;
    }

    directionDetails.encodedPoints =
        res["routes"][0]["overview_polyline"]["points"];

    directionDetails.distanceText =
        res["routes"][0]["legs"][0]["distance"]["text"];

    directionDetails.distanceValue =
        res["routes"][0]["legs"][0]["distance"]["value"];

    directionDetails.durationText =
        res["routes"][0]["legs"][0]["duration"]["text"];

    directionDetails.durationValue =
        res["routes"][0]["legs"][0]["duration"]["value"];

    return directionDetails;
  }
}