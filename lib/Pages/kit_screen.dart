import 'package:flutter/material.dart';
import '../Inventory/kit_service.dart';
import '../Layout/kit_card.dart';

class KitScreen extends StatelessWidget {
  final KitService _kitService = KitService();

  KitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kits', style: TextStyle(color: Colors.blueAccent, fontSize: 25, fontWeight: FontWeight.bold))),
      body: FutureBuilder<List<dynamic>>(
        future: _kitService.getKits(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final inventory = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: inventory.length,
                itemBuilder: (context, index) {
                  CustomKitItem kitContainer;
                  return kitContainer = CustomKitItem(thumbnail: const Image(image: AssetImage('./assets/kits.png') ),
                      id: inventory[index]['id'],
                      nombre: inventory[index]['nombre'],
                      disponible: inventory[index]['disponible'],
                      fecha_in: inventory[index]['fecha_in']);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
