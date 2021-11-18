import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paynow/Animation/FadeAnimation.dart';
import 'package:paynow/Controllers/Controllers.dart';

class DanAika extends StatefulWidget {
  @override
  _DanAikaState createState() => _DanAikaState();
}

class _DanAikaState extends State<DanAika> {
  var pickupLocation, deliveryLocation, deliveryPhone;

  Widget _buildPickup() {
    return Theme(
      data: ThemeData(primaryColor: mainColor),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Pick Up Location",
          labelStyle: TextStyle(fontSize: 16, color: mainColor),
          suffixIcon: IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () {},
            color: mainColor,
          ),
        ),
        onSaved: (value) {
          pickupLocation = value;
        },
        validator: (String value) {
          if (value == null || value.isEmpty) {
            return 'Please enter text';
          } else {
            return null;
          }
        },
        style:
            TextStyle(fontSize: 18, color: Colors.grey[900], letterSpacing: 1),
      ),
    );
  }

  Widget _buildDelivery() {
    return Theme(
      data: ThemeData(primaryColor: mainColor),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Delivery Location",
          labelStyle: TextStyle(fontSize: 16, color: mainColor),
          suffixIcon: IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () {},
            color: mainColor,
          ),
        ),
        onSaved: (value) {
          deliveryLocation = value;
        },
        validator: (String value) {
          if (value == null || value.isEmpty) {
            return 'Please enter text';
          } else {
            return null;
          }
        },
        style:
            TextStyle(fontSize: 16, color: Colors.grey[900], letterSpacing: 1),
      ),
    );
  }

  Widget _buildDeliveryPhone() {
    return Theme(
      data: ThemeData(primaryColor: mainColor),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Delivery Phone Number",
          labelStyle: TextStyle(fontSize: 16, color: mainColor),
          suffixIcon: Icon(
            Icons.phone,
            color: mainColor,
          ),
        ),
        keyboardType: TextInputType.phone,
        onSaved: (value) {
          deliveryPhone = value;
        },
        validator: (String value) {
          if (value == null || value.isEmpty || value.length < 11) {
            return 'Please enter phone';
          } else {
            return null;
          }
        },
        style:
            TextStyle(fontSize: 16, color: Colors.grey[900], letterSpacing: 1),
      ),
    );
  }

  Widget _buildItemDesc() {
    return Theme(
      data: ThemeData(primaryColor: mainColor),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Brief Item Description",
          hintText: "Briefly on the item",
          labelStyle: TextStyle(fontSize: 16, color: mainColor),
          suffixIcon: Icon(
            Icons.textsms,
            color: mainColor,
          ),
        ),
        maxLines: 3,
        keyboardType: TextInputType.phone,
        onSaved: (value) {
          deliveryPhone = value;
        },
        style:
            TextStyle(fontSize: 18, color: Colors.grey[900], letterSpacing: 1),
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        backgroundColor: mainColor,
        onPressed: () {},
      ),
      body: Container(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      topLogo(),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 2),
                            child: Column(
                              children: [
                                FadeAnimation(
                                  1.0,
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 10.0, bottom: 15),
                                      child: Text(
                                        "Schedule a Pick up",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                                FadeAnimation(1.0, _buildPickup()),
                                SizedBox(height: 10),
                                FadeAnimation(1.0, _buildDelivery()),
                                SizedBox(height: 10),
                                FadeAnimation(1.0, _buildDeliveryPhone()),
                                SizedBox(height: 10),
                                FadeAnimation(1.0, _buildItemDesc()),
                                SizedBox(height: 50),
                                FadeAnimation(
                                    1.5,
                                    Container(
                                      width: double.infinity,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: mainColor,
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          if (_formKey.currentState
                                              .validate()) {
                                            // Process data.
                                            _formKey.currentState.save();
                                            FocusScope.of(context).unfocus();
                                            print(pickupLocation);
                                            print(deliveryLocation);
                                            print(deliveryPhone);
                                          }
                                        },
                                        child: Text(
                                          "Request Pick up",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: 40,
                                ),
                                FadeAnimation(
                                    1.5,
                                    Container(
                                      width: double.infinity,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.red[700],
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          _formKey.currentState.reset();
                                          FocusScope.of(context).unfocus();
                                        },
                                        child: Text(
                                          "Reset Form",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
