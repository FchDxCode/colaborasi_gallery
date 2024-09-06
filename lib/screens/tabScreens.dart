import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'berandaScreens.dart';
import 'infoScreens.dart';
import 'galeriScreens.dart';
import 'agendaScreens.dart';

import '../bloc/info/info_bloc.dart';
import '../bloc/info/info_repo.dart';

import '../bloc/galeri/galeri_bloc.dart';
import '../bloc/galeri/galeri_repo.dart';

import '../bloc/agenda/agenda_bloc.dart';
import '../bloc/agenda/agenda_repo.dart';

class TabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu), // Ikon garis tiga
            onPressed: () {
              // Aksi saat ikon ditekan, biasanya membuka Drawer
              Scaffold.of(context).openDrawer();
            },
          ),
          title: Text('SMK NEGERI 4 BOGOR'),
          centerTitle: true, // Agar judul berada di tengah
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.deepPurple], // Warna gradasi biru ke ungu
              ),
            ),
          ),
        ),
        drawer: Drawer(
          // Drawer menu, jika diinginkan bisa tambahkan item menu di sini
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Menu'),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue, Colors.deepPurple], // Warna gradasi di drawer header
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
              // Tambahkan lebih banyak item di sini sesuai kebutuhan
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BerandaScreens(),
            BlocProvider(
              create: (context) => InfoBloc(repository: InfoRepository()),
              child: InfoScreens(),
            ),
            BlocProvider(
              create: (context) => GalleryBloc(repository: GalleryRepository()),
              child: GalleryScreen(),
            ),
            BlocProvider(
              create: (context) => AgendaBloc(repository: AgendaRepository()),
              child: AgendaScreens(),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.deepPurple], // Gradasi pada tab bar bawah
            ),
          ),
          child: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.info), text: 'Info'),
              Tab(icon: Icon(Icons.photo), text: 'Galeri'),
              Tab(icon: Icon(Icons.event), text: 'Agenda'),
            ],
            labelColor: Colors.white, // Warna label ketika dipilih (kontras dengan gradasi)
            unselectedLabelColor: Colors.white70, // Warna label ketika tidak dipilih (lebih terang)
            indicatorColor: Colors.white, // Warna indikator tab
          ),
        ),
      ),
    );
  }
}
