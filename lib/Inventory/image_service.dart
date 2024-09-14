import 'dart:convert'; // Para la conversión base64
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Auth/auth_service.dart';

class ToolThumbnail extends StatefulWidget {

  final String imageId; // Parámetro que será utilizado en la URL


  ToolThumbnail({required this.imageId});

  @override
  _ToolThumbnailState createState() => _ToolThumbnailState();
}

class _ToolThumbnailState extends State<ToolThumbnail> {
  String? base64Image;

  @override
  void initState() {
    super.initState();
    _fetchImage(widget.imageId); // Pasamos el parámetro al método de solicitud
  }

  // Función para obtener la imagen desde la API
  Future<void> _fetchImage(String imageId) async {

    final AuthService _authService = AuthService();
    final token = await _authService.getToken();
    final url = Uri.parse('http://192.168.0.188:8081/api/images/$imageId'); // URL

    final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
    );

    if (response.statusCode == 200) {
      setState(() {
        base64Image = response.body; // El cuerpo de la respuesta contiene la imagen en base64
      });
    } else {
      print('Error al obtener la imagen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85, // Ajustar tamaño como miniatura
      height: 85,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey, width: 2), // Añadir borde
        borderRadius: BorderRadius.circular(12), // Bordes redondeados
      ),
      child: base64Image != null
          ? Image.memory(
        base64Decode(base64Image!), // Decodificar la imagen
        fit: BoxFit.cover,
      )
          : const Center(child: CircularProgressIndicator()), // Mostrar indicador mientras se carga la imagen
    );
  }

}
