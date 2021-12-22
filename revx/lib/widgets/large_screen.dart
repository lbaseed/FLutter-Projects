import 'package:flutter/material.dart';
import 'package:revx/widgets/side_menu.dart';

class LargScreen extends StatelessWidget {
  const LargScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: SideMenu(),
        ),
        Expanded(
          flex: 5,
          child: Container(
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}
