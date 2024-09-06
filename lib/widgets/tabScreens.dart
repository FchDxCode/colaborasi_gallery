import 'package:flutter/material.dart';
import '../screens/berandaScreens.dart';
import '../screens/infoScreens.dart';
import '../screens/galeriScreens.dart';
import '../screens/agendaScreens.dart';

class TabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('DKI Jakarta Ope Data'),
          backgroundColor: Colors.blue,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.heart_broken), text: 'Info'),
              Tab(icon: Icon(Icons.airplanemode_active), text: 'Galeri'),
              Tab(icon: Icon(Icons.person), text: 'Agenda'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BerandaScreens(),
            InfoScreens(),
            GaleriScreens(),
            AgendaScreens(),
          ],
        ),
      ),
    );
  }
}
