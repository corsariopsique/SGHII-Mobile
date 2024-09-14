import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Auth/auth_service.dart';

class WorkerService {
  final String apiUrl = 'http://192.168.0.188:8081/api/operarios';
  final AuthService _authService = AuthService();

  Future<List<dynamic>> getWorkers() async {
    final token = await _authService.getToken();
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('No se pudo cargar el listado de operarios');
    }
  }
}