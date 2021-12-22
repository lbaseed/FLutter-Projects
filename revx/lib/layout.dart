import 'package:flutter/material.dart';
import 'package:revx/helpers/responsiveness.dart';
import 'package:revx/widgets/side_menu.dart';
import 'package:revx/widgets/widgets.dart';

// ignore: use_key_in_widget_constructors
class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  // const SiteLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: Drawer(
        child: SideMenu(),
      ),
      body: const ResponsiveWidget(
        largeScreen: LargScreen(),
        smallScreen: SmallScreen(),
      ),
    );
  }
}
