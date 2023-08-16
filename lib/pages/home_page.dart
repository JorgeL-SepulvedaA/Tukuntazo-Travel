import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tukuntazo_travel/pages/googleMapScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final user = FirebaseAuth.instance.currentUser;
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Example'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'Buscar'),
              Tab(text: 'Capturar'),
              Tab(text: 'Favorites'),
              Tab(text: 'Profile'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            GoogleMapsWidget(),
            Center(child: Text('Buscar Content')),
            Center(child: Text('Capturar Content')),
            Center(child: Text('Favorites Content')),
            Center(child: Text('Profile Content')),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: signOut,
          child: const Icon(Icons.logout),
        ),
      ),
    );
  }
}
