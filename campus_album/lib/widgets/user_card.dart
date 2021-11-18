import 'package:campus_album/models/models.dart';
import 'package:campus_album/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print("user card"),
      child: Row(
        children: [
          ProfileAvatar(imageUrl: user.imageUrl),
          const SizedBox(width: 6.0),
          Text(
            user.name,
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
