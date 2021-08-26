import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Users {
  String? id;
  String? email;
  String? name;
  String? phone;

  Users({required this.id, this.email, this.name, this.phone});

  Users.fromSnapShot(DataSnapshot dataSnapshot) {
    id = dataSnapshot.key!;
    email = dataSnapshot.value["email"];
    name = dataSnapshot.value["name"];
    phone = dataSnapshot.value["phone"];
  }
}
