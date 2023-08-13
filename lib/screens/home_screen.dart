import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
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
        children: [
          Center(child: Text('Bienvenido al home')),
          Center(child: Text('Página de Mapa')),
          Center(child: Text('Perfil del Capturar')),
          Center(child: Text('Página de Faboritos')),
          Center(child: Text('Perfil del Perfil')),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        indicatorColor: Colors.blue, // Cambia el color del indicador activo
        labelColor: Colors.blue, // Cambia el color del texto activo
        unselectedLabelColor: Colors.grey, // Cambia el color del texto inactivo
        tabs: [
          Tab(icon: Icon(Icons.home), text: 'Inicio'),
          Tab(icon: Icon(Icons.map), text: 'Mapa'),
          Tab(icon: Icon(Icons.camera), text: 'Capturar'),
          Tab(icon: Icon(Icons.star), text: 'Faboritos'),
          Tab(icon: Icon(Icons.person), text: 'Perfil'),
        ],
      ),
    );
  }
}
