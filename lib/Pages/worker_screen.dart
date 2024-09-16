import 'package:flutter/material.dart';
import '../Inventory/worker_service.dart';
import '../Inventory/image_service.dart';
import '../Layout/worker_card.dart';

class WorkerScreen extends StatelessWidget {
  final WorkerService _workerService = WorkerService();

  WorkerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Operarios', style: TextStyle(color: Colors.blueAccent, fontSize: 25, fontWeight: FontWeight.bold))),
      body: FutureBuilder<List<dynamic>>(
        future: _workerService.getWorkers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final workers = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: workers.length,
                itemBuilder: (context, index) {
                  ToolThumbnail imageContainer;
                  CustomWorkerItem workerContainer;
                  return workerContainer = CustomWorkerItem(thumbnail: imageContainer = ToolThumbnail(imageId: workers[index]['id'], tipo: 2),
                      id: workers[index]['id'],
                      nombre: workers[index]['nombre'],
                      rol: workers[index]['rol'],
                      estado: workers[index]['estado'],
                      fecha_in: workers[index]['fecha_in']);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
