import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapHome extends StatelessWidget {
  const MapHome({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(18.676128098471082, -70.17047171264215), // Latitud y longitud del centro del mapa
        zoom: 17.0, // Nivel de zoom
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        // Puedes agregar más capas aquí (marcadores, polígonos, etc.)
      ],
    );
  }
}
