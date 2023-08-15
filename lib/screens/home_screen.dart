import 'package:flutter/material.dart';
import 'package:tukuntazo_travel/widgets/map_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this); // 3 tabs: Inicio, Buscar, Perfil
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TukuntazoTravel'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          MapHome(),// Center(child: Text('Página de home')),
          Center(child: Text('Página de Faboritos')),
          Center(child: Text('Página de Nueva Captura')),
          Center(child: Text('Página de Guardados')),
          Center(child: Text('Página de perfil de usuario')),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        indicatorColor: Colors.blue, // Cambia el color del indicador activo
        labelColor: Colors.blue, // Cambia el color del texto activo
        unselectedLabelColor: Colors.grey, // Cambia el color del texto inactivo
        tabs: const [
          Tab(icon: Icon(Icons.home), text: 'Home'),
          Tab(icon: Icon(Icons.favorite), text: 'Favs'),
          Tab(icon: Icon(Icons.camera), text: 'Capturar'),
          Tab(icon: Icon(Icons.save), text: 'Saved'),
          Tab(icon: Icon(Icons.person), text: 'Profile'),
        ],
      ),
    );
  }
}
