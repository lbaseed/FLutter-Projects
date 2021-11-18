import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paynow/Controllers/Controllers.dart';

class Tailoring extends StatefulWidget {
  @override
  _TailoringState createState() => _TailoringState();
}

class _TailoringState extends State<Tailoring> {
  var pickupLocation, deliveryLocation, deliveryPhone;

  Widget _buildPickup() {
    return Theme(
      data: ThemeData(primaryColor: mainColor),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Select Disco",
          labelStyle: TextStyle(fontSize: 16, color: mainColor),
          suffixIcon: IconButton(
            icon: Icon(Icons.apartment),
            onPressed: () {},
            color: mainColor,
          ),
          border:
              new OutlineInputBorder(borderSide: BorderSide(color: mainColor)),
        ),
        onSaved: (value) {
          pickupLocation = value;
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
          labelText: "Type of Bill",
          hintText: "Prepaid/Postpaid",
          labelStyle: TextStyle(fontSize: 16, color: mainColor),
          suffixIcon: IconButton(
            icon: Icon(Icons.input),
            onPressed: () {},
            color: mainColor,
          ),
          border: OutlineInputBorder(),
        ),
        onSaved: (value) {
          deliveryLocation = value;
        },
        style:
            TextStyle(fontSize: 18, color: Colors.grey[900], letterSpacing: 1),
      ),
    );
  }

  Widget _buildDeliveryPhone() {
    return Theme(
      data: ThemeData(primaryColor: mainColor),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Meter Number",
          hintText: "Meter/Customer Number",
          labelStyle: TextStyle(fontSize: 16, color: mainColor),
          suffixIcon: Icon(
            Icons.dialpad,
            color: mainColor,
          ),
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
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
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 2),
                        child: Column(
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 15),
                                child: Text(
                                  "Tailoring",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            _buildPickup(),
                            SizedBox(height: 20),
                            _buildDelivery(),
                            SizedBox(height: 20),
                            _buildDeliveryPhone(),
                            SizedBox(height: 30),
                            Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: mainColor),
                              child: TextButton(
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    // Process data.
                                    _formKey.currentState.save();
                                    FocusScope.of(context).unfocus();
                                  }
                                },
                                child: Text(
                                  "Process",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.red[700]),
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
