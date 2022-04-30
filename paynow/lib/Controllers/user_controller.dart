import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:paynow/Controllers/globals.dart' as globals;

class User {
  String firstName, lastName, phone, email, username, password;
  String token;
  String url = globals.serverUrl;
 
  User(
      {this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.username,
      this.password});

  Future<bool> loginUser() async {
    Map<String, dynamic> data;

    //send login data to get token

    Map payload = {"username": username, "password": password};
    String body = json.encode(payload);

    try {
      //encode payload as json and send request for token

      http.Response responce = await http.post("$url/authenticate",
          headers: {"Content-Type": "application/json"}, body: body);

      if (responce.body.isNotEmpty) {
        data = json.decode(responce.body);

        if ("${data['code']}" == "200") {
//loop through the data and store token

          data.forEach((key, value) {
            if (key == "session") {
              var tokenData = value;
              globals.tokenType = tokenData['token_type'];
              globals.token = tokenData['token'];
              globals.isLoggedIn = true;
            }
            if (key == "data") {
              var userData = value;
              globals.firstName = userData["firstName"];
              globals.otherNames = userData["otherNames"];
              globals.phone = userData["phone"];
              globals.type = userData["type"];
              globals.role = userData["role"];
              globals.accBalance = double.parse(userData["acc_bal"]);
            }
          });
        } else if ("${data['code']}" == "403") {
          print("${data['message']}");
        }
      } else {
        print("Response Error");
      }
    } catch (e) {
      print(e.toString());
    }

    return true;
  }

  // ignore: missing_return
  Future<bool> registerUser() async {
    Map<String, dynamic> data;

    //send login data to get token

    Map payload = {
      "first_name": firstName,
      "other_names": lastName,
      "phone": phone,
      "username": username,
      "password": password
    };
    String body = json.encode(payload);

    try {
      //encode payload as json and send request for token

      http.Response responce = await http.post("$url/user",
          headers: {"Content-Type": "application/json"}, body: body);

      if (responce.body.isNotEmpty) {
        data = json.decode(responce.body);

        print(data);
        if ("${data['code']}" == "200") {
          return true;
        } else if ("${data['code']}" == "403") {
          return false;
        }
      } else {
        print("Response Error");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
