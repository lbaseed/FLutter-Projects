import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ryder/AllWidgets/all_widgets.dart';
import 'package:ryder/DataHandler/appData.dart';
import 'package:ryder/Models/models.dart';
import 'package:ryder/assistance/request_assistant.dart';
import 'package:ryder/configMaps.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController pickUpTextController = TextEditingController();
  TextEditingController dropOffTextController = TextEditingController();

  List<PlacePredictions> placePredictionList = [];

  @override
  Widget build(BuildContext context) {
    String placeAddress =
        Provider.of<AppData>(context).pickUpLocation!.placeName ?? "";
    pickUpTextController.text = placeAddress;
    // String dropOffAddress =
    //     Provider.of<AppData>(context).dropOffLocation?.placeName ?? "";
    // dropOffTextController.text = dropOffAddress;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  blurRadius: 6.0,
                  spreadRadius: 0.5,
                  offset: Offset(0.7, 0.7))
            ]),
            child: Padding(
              padding: EdgeInsets.only(
                  left: 25.0, top: 30.0, right: 25.0, bottom: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 5.0),
                  Stack(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back)),
                      Center(
                        child: Text(
                          "Set Drop Off",
                          style: TextStyle(
                              fontFamily: "Brand-Bold", fontSize: 18.0),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Image.asset("images/pickicon.png",
                          height: 16.0, width: 16.0),
                      SizedBox(width: 18.0),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: EdgeInsets.all(3.0),
                          child: TextField(
                            controller: pickUpTextController,
                            decoration: InputDecoration(
                                hintText: "PickUp Location",
                                fillColor: Colors.grey[400],
                                filled: true,
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.only(
                                    left: 11.0, top: 8.0, bottom: 8.0)),
                          ),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Image.asset("images/desticon.png",
                          height: 10.0, width: 16.0),
                      SizedBox(width: 18.0),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: EdgeInsets.all(3.0),
                          child: TextField(
                            onChanged: (val) {
                              findPlace(val);
                            },
                            controller: dropOffTextController,
                            decoration: InputDecoration(
                                hintText: "Where to?",
                                fillColor: Colors.grey[400],
                                filled: true,
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.only(
                                    left: 11.0, top: 8.0, bottom: 8.0)),
                          ),
                        ),
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),

          //tile for predictions
          SizedBox(height: 10.0),
          (placePredictionList.length > 0)
              ? Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                      child: ListView.separated(
                        padding: EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          return PredictionTile(
                              placePredictions: placePredictionList[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            DividerWidget(),
                        itemCount: placePredictionList.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  void findPlace(String placeName) async {
    if (dropOffTextController.text.length > 0) {
      String autoCompleteUrl =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&types=establishment&key=$mapKey&components=country:ng";

      var res = await RequestAssistant.getRequest(autoCompleteUrl);

      if (res == "Failed") {
        return;
      }

      if (res["status"] == "OK") {
        var predictions = res["predictions"];

        var placesList = (predictions as List)
            .map((e) => PlacePredictions.fromJson(e))
            .toList();

        setState(() {
          placePredictionList = placesList;
        });
      }
    }
  }
}

class PredictionTile extends StatelessWidget {
  final PlacePredictions placePredictions;

  const PredictionTile({Key? key, required this.placePredictions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        getPlaceAddressDetails(placePredictions.place_id!, context);
      },
      child: Column(
        children: [
          SizedBox(width: 10.0),
          Row(
            children: [
              Icon(Icons.add_location),
              SizedBox(width: 14.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.0),
                    Text(placePredictions.main_text!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16.0)),
                    SizedBox(height: 2.0),
                    Text(placePredictions.secondary_text!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12.0, color: Colors.grey)),
                    SizedBox(height: 8.0)
                  ],
                ),
              )
            ],
          ),
          SizedBox(width: 10.0),
        ],
      ),
    );
  }

  void getPlaceAddressDetails(String placeId, context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            ProgressDialog(message: "Setting DropOff, Please wait..."));
    String placeDetailUrl =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$mapKey";

    var res = await RequestAssistant.getRequest(placeDetailUrl);

    Navigator.pop(context);
    if (res == "Failed") {
      return;
    }

    if (res["status"] == "OK") {
      Address address = Address();

      address.placeName = res["result"]["name"];
      address.placeId = placeId;
      address.latitude = res["result"]["geometry"]["location"]["lat"];
      address.longitude = res["result"]["geometry"]["location"]["lng"];

      Provider.of<AppData>(context, listen: false)
          .updateDropOffLocationAddress(address);

      print("this is drop off address");

      print(address.placeName);

      Navigator.pop(context, "obtainDirection");
    }
  }
}
