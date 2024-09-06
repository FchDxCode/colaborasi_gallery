import 'package:flutter/material.dart';
import 'berandaScreens.dart';
import 'infoScreens.dart';
import 'galeriScreens.dart';
import 'agendaScreens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/galeri/galeri_bloc.dart';
import '../bloc/galeri/galeri_repo.dart';


class TabScreens extends StatelessWidget {
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
            BlocProvider(
              create: (context) => GaleriBloc(repository: GaleriRepository()),
              child: GaleriScreens(),
            ),
            AgendaScreens(),
          ],
        ),
      ),
    );
  }
}
