import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future<List<Map<String, dynamic>>> fetchOffices() async {
  final response = await http.get(Uri.parse(
      'https://about.google/static/data/locations.json?hl=es-419'));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final offices = List<Map<String, dynamic>>.from(jsonData['offices']);
    return offices;
  } else {
    throw Exception('Failed to load data');
  }
}

class OfficesWidget extends StatelessWidget {
  const OfficesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchOffices(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No data available.');
        } else {
          final offices = snapshot.data;
          return ListView.builder(
            itemCount: offices!.length,
            itemBuilder: (context, index) {
              final office = offices![index];
              return ListTile(
                title: Text(office['name']),
                subtitle: Text(office['address']),
              );
            },
          );
        }
      },
    );
  }
}
