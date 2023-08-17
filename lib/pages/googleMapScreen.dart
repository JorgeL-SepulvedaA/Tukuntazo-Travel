import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:tukuntazo_travel/pages/locations.dart' as locations;

class GoogleMapsWidget extends StatefulWidget {
  const GoogleMapsWidget({super.key});

  @override
  _GoogleMapsWidgetState createState() => _GoogleMapsWidgetState();
}

class _GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  late GoogleMapController mapController;
  final LatLng _center =
      const LatLng(37.7749, -122.4194); // Ubicación inicial (San Francisco, CA)

  List<locations.Office> filteredOffices = []; // Lista filtrada de ubicaciones
  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      filteredOffices = googleOffices.offices;
      _updateMarkers();
    });
  }

  void _filterOffices(String query) {
    final filtered = filteredOffices.where((office) {
      final nameLower = office.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();

    setState(() {
      filteredOffices = filtered;
      _updateMarkers();
    });
  }

  void _updateMarkers() {
    _markers.clear();
    for (final office in filteredOffices) {
      final marker = Marker(
        markerId: MarkerId(office.name),
        position: LatLng(office.lat, office.lng),
        infoWindow: InfoWindow(
          title: office.name,
          snippet: office.address,
        ),
      );
      _markers[office.name] = marker;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchTextField(onChanged: _filterOffices), // Pasar el método onChanged
        Expanded(
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.7749, -122.4194),
              zoom: 2,
            ),
            markers: _markers.values.toSet(),
          ),
        ),
      ],
    );
  }
}

class SearchTextField extends StatelessWidget {
  final Function(String) onChanged;

  const SearchTextField({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Search Locations',
          suffixIcon: Icon(Icons.search),
        ),
        onChanged: onChanged, // Llamar al método de filtrado pasado desde el padre
      ),
    );
  }
}

