import 'package:flutter/material.dart';
import '../Inventory/inventory_service.dart';
import '../Inventory/image_service.dart';
import '../Layout/tool_card.dart';

class InventoryScreen extends StatelessWidget {
  final InventoryService _inventoryService = InventoryService();

  InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inventario', style: TextStyle(color: Colors.blueAccent, fontSize: 25, fontWeight: FontWeight.bold))),
      body: FutureBuilder<List<dynamic>>(
        future: _inventoryService.getInventory(),
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
                  ToolThumbnail imageContainer;
                  CustomToolItem toolContainer;
                  return toolContainer = CustomToolItem(thumbnail: imageContainer = ToolThumbnail(imageId: inventory[index]['id'], tipo: 1),
                      id: inventory[index]['id'],
                      nombre: inventory[index]['nombre'],
                      cantidad_D: inventory[index]['cantidad_disponible'],
                      marca: inventory[index]['marca'],
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
